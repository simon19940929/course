class CoursesController < ApplicationController
	def index
		if params[:name].blank?
			if params[:teacher].blank?
				if params[:time].blank?
					@courses=Course.all
				end
			end
		end

		if params[:name].present? 
			if params[:time].present?
				if params[:teacher].present?
					@courses = Course.where(name:params[:name]).where(time:params[:time]).where(teacher:params[:teacher])
				end
				if params[:teacher].blank?
					@courses = Course.where(name:params[:name]).where(time:params[:time])
				end
			end

			if params[:time].blank?
				if params[:teacher].present?
					@courses = Course.where(name:params[:name]).where(teacher:params[:teacher])
				end
				if params[:teacher].blank?
					@courses = Course.where(name:params[:name])
				end
			end
		end

		if params[:name].blank?
			if params[:time].present?
				if params[:teacher].present?
					@courses = Course.where(time:params[:time]).where(teacher:params[:teacher])
				end
				if params[:teacher].blank?
					@courses = Course.where(time:params[:time])
				end
			end
		end

		if params[:name].blank?
			if params[:time].blank?
				if params[:teacher].present?
					@courses = Course.where(teacher:params[:teacher])
				end
			end	
		end	
	end

	def new
		@course = Course.new
	end

	def create
		Course.create(course_params)
		redirect_to courses_path
	end

	def edit
		@course = Course.find(params[:id])
	end

	def update
		@course = Course.find(params[:id])
	  	@course.update_attributes(course_params)
		redirect_to courses_path
	end

	def destroy
		@course = Course.find(params[:id])
		@course.destroy
		redirect_to courses_path
	end

	def query
		@course = Course.all
		if params[:name].present?
			@course=@course.where(teacher:params[:name]).where(time:params[:name])
			
		end
	end

	private

	def course_params
		params.require(:course).permit(:name, :time, :teacher, :classroom, :credit)
	end
end
