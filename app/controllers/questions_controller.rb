class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update show destroy edit]

  def create
    question = Question.create(question_params)

    redirect_to question_path(question), notice: 'New question created'
  end

  def update
    @question.update(question_params)

    redirect_to question_path(@question), notice: 'Question saved'
  end

  def destroy
    @question.destroy

    redirect_to questions_path, notice: 'Question deleted'
  end

  def show
  end

  def index
    @question = Question.new
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
  end

  # hw part for transparent question
  def hide
    @question = Question.find(params[:id])
    @question.update(:hidden => true)

    redirect_to question_path(@question), notice: 'Question hidden'
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id, :hidden)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
