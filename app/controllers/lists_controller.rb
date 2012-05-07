class ListsController < ApplicationController
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @list }
    end
  end

  def create
    @list = List.create

    respond_to do |format|
      if @list.save
        format.html { redirect_to list_items_path(@list), notice: 'List was successfully created.' }
        format.json { render json: @list, status: :created, location: @list }
      else
        format.html { render action: "new" }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # def destroy
  #   @list = List.find(params[:id])
  #   @list.destroy

  #   respond_to do |format|
  #     format.html { redirect_to lists_url }
  #     format.json { head :no_content }
  #   end
  # end
end
