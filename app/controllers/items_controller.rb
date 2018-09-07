class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    id = item.id
    @item = Item.find_by(:id)
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  def update
    id = item.id
    @item = Item.find_by(:id)
    @item.update(item_params)
  end

  def destroy
    id = item.id
    @item = Item.find_by(:id)
    @item.destroy
  end

  private
    def item_params
      params.require(:item).permit(:task, :completed)
    end
end
