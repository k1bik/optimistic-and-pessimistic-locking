class PessimisticItemsController < ApplicationController
  def edit
    @item = PessimisticItem.find(params[:id])
  end

  def update
    # @item = PessimisticItem.find(params[:id])

    # @item.with_lock do
    #   if @item.update(item_params)
    #     sleep 5
    #     redirect_to pessimistic_item_path(@item)
    #   else
    #     render :edit
    #   end
    # end

    PessimisticItem.transaction do
      @item = PessimisticItem.lock("FOR UPDATE NOWAIT").find(params[:id])

      if @item.update(item_params)
        sleep 5
        redirect_to pessimistic_item_path(@item)
      else
        render :edit
      end
    end
  rescue ActiveRecord::LockWaitTimeout 
    render :edit
  end

  def show
    @item = PessimisticItem.find(params[:id])
  end
  
  private

  def item_params
    params.require(:pessimistic_item).permit(:title)
  end
end
