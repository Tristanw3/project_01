class CoursesController < ApplicationController
  def index
    authenticate_user!
    @courses = Course.all
  end
  
  def new
    authenticate_user!
    
    @course = Course.new

  end

  def create
    authenticate_user!
    @course = Course.new(course_params)
    
    # Add user id
    @course.user_id = current_user.id

    if @course.save
      redirect_to @course
    end

  end

  def show
    authenticate_user!
    @course = Course.find(params[:id])

  end

  def edit
    @course = Course.find(params[:id])

  end

  def update
    @course = Course.find(params[:id])
    @course.update(
      course_name: params[:course][:course_name], 
      description: params[:course][:description],
      link: params[:course][:link],
      image: params[:course][:image]
    )
    redirect_to course_path(@course)
  end

  def destroy
    @course = Course.find(params[:id])
    if @course.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to courses_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to courses_url
    end
  end

  private
  def course_params
    params.require(:course).permit(:course_name, :image, :link, :description)
  end
end
