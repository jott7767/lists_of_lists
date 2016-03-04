class ItemsController < ApplicationController
   def index
     @list = List.find(params[:list_id])
     @items = @list.items
   end

   def new
    @list = List.find(params[:list_id])
    @item = Item.new
   end

  def create
    @list = List.find(params[:list_id])
    @list.items.create(item_params)
    redirect_to list_path(@list)
  end

  def edit
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @list.items.find(params[:id]).update(item_params)
    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:list_id])
    @list.items.find(params[:id]).destroy
    redirect_to list_path(@list)
  end

  private
   def item_params
     params.require(:item).permit(:title)
   end

end
