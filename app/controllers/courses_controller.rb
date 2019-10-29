class CoursesController < ApplicationController
  def new
    authenticate_user!
    @course = Course.new
  end

  def create
    authenticate_user!
    @course = Course.new(
    course_params
    )

    @course.user_id = current_user.id
    
    @course.save

    redirect_to courses_path

  end

  def index
    authenticate_user!
    @courses = Course.all
  end

  private
  def course_params
    params.require(:course).permit(:course_name, :image, :link)
  end
end
