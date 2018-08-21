class QuestionsAndAnswersController < ApplicationController

  before_action :check_timestamp, only: [:show]

  def check_timestamp
    points = params[:points]
    timestamp = params[:timestamp].to_time
    runned_time = Time.now - timestamp
    if runned_time > 45
      flash[:success] = "Zeit ist abgelaufen, Gratuliere #{points} Punkte"
      redirect_to root_path
    end
  end

  def show
    @character = params[:character].to_sym
    @index = params[:index].to_i
    @points = params[:points]
    @time = params[:timestamp]
    @question_and_answers = QuestionAndAnswers.find(character: @character, index: @index)
    questions_and_answers = QuestionAndAnswers.from_character(@character)
    if @index == questions_and_answers.size
      flash[:success] = "Gratuliere #{@points} Punkte"
      redirect_to root_path
    end
  end

  def create
    character = params[:character].to_sym
    index = params[:index].to_i
    points = params[:points].to_i
    time = params[:timestamp]
    question_and_answers = QuestionAndAnswers.find(character: character, index: index)
    right_answers = question_and_answers.answers
    user_answer = params[:user][:answer]
    if right_answer?(right_answers, user_answer)
      points += 1
      flash[:success] = "Right Answer"
    else
      flash[:failure] = "Wrong Answer, right answer would have been: #{right_answers.join(', ')}"
    end
    url = "/users/#{points}/time/#{time}?character=#{character}&index=#{next_index(index)}"
    redirect_to url
  end

  private

  def right_answer?(right_answers, user_answer)
    right_answers.include?(user_answer)
  end

  def next_index(index)
    index += 1
  end
end
