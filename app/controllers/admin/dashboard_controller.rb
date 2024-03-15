class Admin::DashboardController < ApplicationController
  def show
    @productcount = Product.all.count
    @categorycount = Category.all.count
  end
end
