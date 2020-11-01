class StudentsController < ApplicationController
  before_action :student_find, only: [:show, :edit, :update]

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(strong_params(:first_name, :last_name))
    @student.save
    redirect_to student_path(@student)
  end

  def show
  end

  def edit
  end

  def update
    @student.update(strong_params(:first_name, :last_name))
    redirect_to student_path(@student)
  end

  private

  def student_find
    @student = Student.find(params[:id])
  end

  def strong_params(*args)
    params.require(:student).permit(*args)
  end

end