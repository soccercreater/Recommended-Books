class Public::AssessmentsController < ApplicationController
  def new
    @assessment = Assessment.new
  end

  def update
  end

  def create
    @assessment = Assessment.new(assessment_params)
    @assessment.save
    redirect_to books_path
  end

  def assessment_params
    params.require(:assessment).permit(:comment)
  end
end
