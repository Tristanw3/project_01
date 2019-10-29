class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    @course = Course.new(
      # course_name: params[:course_name],
      # image: params[:image],
      # link: params[:link],
      # user_id: current_user['id']
    course_params
    )

    @course.user_id = current_user.id
    
    redirect_to courses_path

  end

  def index
    @courses = Course.all
  end

  private
  def course_params
    params.require(:course).permit(:course_name, :image, :link)
  end
end
