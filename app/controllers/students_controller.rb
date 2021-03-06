# frozen_string_literal: true

class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = 'You have successfully signed up'
      redirect_to root_path
    else
      flash[:error] = 'Put something in'
      render 'new'
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :password)
  end
end
