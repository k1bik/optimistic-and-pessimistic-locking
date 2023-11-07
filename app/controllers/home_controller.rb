class HomeController < ApplicationController
  def index
    @pessimistic_item = PessimisticItem.first
    @optimistic_item = OptimisticItem.first
  end
end
