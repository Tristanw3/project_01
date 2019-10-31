class CoursesController < ApplicationController
  def index
    authenticate_user!
    @courses = Course.all
  end
  
  def new
    authenticate_user!
    
    @course = Course.new

    # @review = Review.new(course_id: params[:course_id])
    
  end

  def create
    authenticate_user!
    @course = Course.new(course_params)
    
    # Add user id
    @course.user_id = current_user.id

    p "---------------------------------------------"
    p @course
    p "---------------------------------------------"

    if @course.save
      redirect_to @course
    end

  end

  def show
    authenticate_user!
    @reviews = Review.all
    @course = Course.find(params[:id])

    @x = params[:id]
    
  end

  private
  def course_params
    params.require(:course).permit(:course_name, :image, :link, :description)
  end
end
