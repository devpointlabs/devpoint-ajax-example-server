class Api::V1::CoursesController < ApplicationController
	before_action :find_course, only: [:show, :update, :destroy]

	def index
	  respond_to do |format|
	    format.json { render json: Course.all }
	  end
	end

	def show
	  respond_to do |format|
	    if @course
	      format.json { render json: @course }
	    else
	      format.json { render json: {message: "Course not found with ID: #{params[:id]}"}, status: 404 }
	    end
	  end
	end

	def create
	  respond_to do |format|
	    course = Course.create(course_params)
	    if course.persisted?
	       format.json { render json: course, status: 201 }
	    else
	       format.json { render json: {message: "Course was NOT created successfully: #{course.errors.full_messages.join(' and ')}"}, status: 400  }
	    end
	  end
	end

	def update
	  respond_to do |format|
	    if @course
	      if @course.update(course_params)
	        format.json { render json: @course.reload }
	      else
	        format.json { render json: {message: "Course was NOT updated successfully: #{@course.errors.full_messages.join(' and ')}"}, status: 400  }
	      end
	    else
	       format.json { render json: {message: "Course not found with ID: #{params[:id]}"}, status: 404 }
	    end
	  end
	end

	def destroy
	  respond_to do |format|
	    if @course
	      title = @course.title
	      @course.destroy
	      format.json { render json: {message: "Course with title: #{title} destroyed successfully."} }
	    else
	      format.json { render json: {message: "Course not found with ID: #{params[:id]}"}, status: 404 }
	    end
	  end
	end

	private
	  def find_course
	    @course = Course.find_by(id: params[:id])
	  end

	  def course_params
	    params.require(:course).permit(:title, :code, :description, :active, extra_resources: [])
	  end
end
