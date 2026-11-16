class ReviewsController < ApplicationController

    before_action :require_login
    before_action :set_movie
    before_action :set_review, only: [:edit, :update, :destroy]

    def create
        @review = @movie.reviews.build(review_params)
        @review.user = current_user

        if @review.save
            redirect_to movie_path(@movie), notice: "Review added successfully"
        else
            redirect_to movie_path(@movie), alert: "Review cannot be empty"
        end
    end

    def edit
    end

    def update
        if @review.update(review_params)
            redirect_to movie_path(@movie), notice: "Review updated successfully"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @review.destroy
        redirect_to movie_path(@movie), notice: "Review deleted successfully"
    end

    private

    def set_movie
        @movie = Movie.find(params[:movie_id])
    end

    def set_review
        @review = @movie.reviews.find(params[:id])

        unless @review.user == current_user
            redirect_to movie_path(@movie), alert: "You can only manage your own reviews"
        end
    end

    def review_params
        params.require(:review).permit(:content)
    end
end
