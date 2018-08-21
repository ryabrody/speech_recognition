class GamesController < ApplicationController
  def show
    @character = params[:character].to_sym
    @questions_and_answers = QuestionAndAnswers.from_character(@character)
  end
end
