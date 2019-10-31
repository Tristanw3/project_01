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

    # @review = Review.new(review_params)
    
    # @review.course_id = @x
    p 'xxxxxxxxxxxxxxx'
    p params
    p 'xxxxxxxxxxxxxxx'

    

    redirect_to course_path(@course)
    

    p "---------------------------------------------"
    p @review
    p "---------------------------------------------"

    

    # redirect_to courses_path
  end


  private
  def review_params
    params.require(:review).permit(:review_text, :course_id)
  end
end
