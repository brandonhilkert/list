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

  def clear
    @list = List.find(params[:id])
    @list.items.destroy_all

    render nothing: true, status: :ok
  end
end
