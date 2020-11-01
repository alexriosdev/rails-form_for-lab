class SchoolClassesController < ApplicationController
  before_action :sc_find, only: [:show, :edit, :update]
  
  def new
    @school_class = SchoolClass.new
  end

  def create
    @school_class = SchoolClass.new(strong_params(:title, :room_number))
    @school_class.save
    redirect_to school_class_path(@school_class)
  end

  def show
  end

  def edit
  end

  def update
    @school_class.update(strong_params(:title, :room_number))
    redirect_to school_class_path(@school_class)
  end

  private

  def sc_find
    @school_class = SchoolClass.find(params[:id])
  end

  def strong_params(*args)
    params.require(:school_class).permit(*args)
  end

end