class OptimisticItemsController < ApplicationController
  def index
    @items = OptimisticItem.all
  end

  def edit
    @item = OptimisticItem.find(params[:id])
  end

  def update
    @item = OptimisticItem.find(params[:id])

    if @item.update(item_params)
      redirect_to optimistic_item_path(@item)
    else
      render :edit
    end

  rescue ActiveRecord::StaleObjectError
    render :edit
  end

  def show
    @item = OptimisticItem.find(params[:id])
  end

  private

  def item_params
    params.require(:optimistic_item).permit(:title, :lock_version)
  end
end
