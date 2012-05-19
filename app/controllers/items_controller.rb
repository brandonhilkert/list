class ItemsController < ApplicationController
  before_filter :get_list_from_slug

  def index
    @items = @list.items
    render json: @items.to_json(except: [:created_at, :updated_at]) 
  end

  def create
    item = @list.items.build(params[:item])
    
    if item.save
      render json: item, status: :created
    else
      render json: nil, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.where(id: params[:id], list_id: @list.id).first
    @item.destroy if @item.present?

    head :no_content
  end

  private

    def get_list_from_slug
      @list = List.find(params[:list_id])
    end
end
