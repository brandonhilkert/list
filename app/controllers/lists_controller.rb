class ListsController < ApplicationController
  def new
  end

  def create
    list = List.new
    
    if list.save
      render json: list, status: :created
    else
      render json: list.errors, status: :unprocessable_entity
    end
  end
end
