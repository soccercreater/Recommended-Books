class Public::AssessmentsController < ApplicationController
  def new
    @assessment = Assessment.new
  end

  def show
    @book = Book.find(params[:id])
  #   @assessment = @book.id.assessment
  end

  def update
    @assessment.update(assessment_params)
    redirect_to assessment_path(@assessment.id)
  end

  def create
    # @user.book_id = current_user.book.id
    @assessment = Assessment.new(assessment_params)
    @assessment.user_id = current_user.id
    # @assessment.book_id = current_user.book.id
    @assessment.save
    redirect_to books_path

    # @assessment = Assessment.new(assessment_params)
    # @assessment.save
    # redirect_to books_path
  end

  def assessment_params
    params.require(:assessment).permit(:comment, :user_id, :book_id)
  end
end
