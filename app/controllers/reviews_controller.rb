class ReviewsController < ApplicationController
   def index
    authenticate_user!
    # @reviews = Review
  end
  
  def new
    @review = Review.new(course_id: params[:course_id])
  end
  
  def create
    
    @course = Course.find(params[:course_id])
    @review = @course.reviews.create(review_params)
    @review.user_id = current_user.id
    @review.save
    
    redirect_to course_path(@course)
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to courses_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to courses_url
    end
  end

  private
  def review_params
    params.require(:review).permit(:review_text, :course_id)
  end
end
