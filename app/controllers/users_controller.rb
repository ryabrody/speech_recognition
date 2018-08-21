class UsersController < ApplicationController
  def show
    @character = params[:character].to_sym
    @index = params[:index].to_i
    @points = params[:points]
    @time = params[:timestamp]
  end
end
