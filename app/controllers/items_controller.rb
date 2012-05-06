class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    @item = Item.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { redirect_to items_path }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  def clear
    Item.destroy_all

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { render nothing: true, status: :ok }
    end
  end
end
