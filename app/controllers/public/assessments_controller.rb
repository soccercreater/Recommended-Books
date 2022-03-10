class Public::AssessmentsController < ApplicationController
  def new
    @assessment = Assessment.new
    @book = Book.find(params[:book_id])
  end

  def show
    @book = Book.find(params[:id])
    @assessments = @book.assessments
  end

  def edit
    @book = Book.find(params[:book_id])
  end

  def update
    @assessment.update(assessment_params)
    redirect_to assessment_path(@assessment.id)
  end

  def create
    @assessment = Assessment.new(assessment_params)
    @assessment.user_id = current_user.id
    @assessment.save!
    redirect_to books_path
  end

  def destroy
    @assessment = Assessment.find(params[:id])
    @assessment.destroy
    redirect_to books_path
  end

  def assessment_params
    params.require(:assessment).permit(:comment, :user_id, :book_id)
  end
end
