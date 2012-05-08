class ItemsController < ApplicationController
  before_filter :get_list_from_slug

  def index
    @items = @list.items

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items.to_json(except: [:created_at, :updated_at, :list_id]) }
    end
  end

  def create
    item = @list.items.create(params[:item])

    respond_to do |format|
      if item.present?
        format.html { redirect_to list_items_url(@list) }
        format.json { render json: item, status: :created, location: item }
      else
        format.html { redirect_to list_items_url(@list) }
        format.json { render json: nil, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item = Item.where(id: params[:id], list_id: @list.id).first
    @item.destroy if @item.present?

    respond_to do |format|
      format.html { redirect_to list_items_url(@list) }
      format.json { head :no_content }
    end
  end

  def clear
    @list.items.destroy_all

    respond_to do |format|
      format.html { redirect_to list_items_url }
      format.json { render nothing: true, status: :ok }
    end
  end

  private

    def get_list_from_slug
      @list = List.find(params[:list_id])
    end
end
