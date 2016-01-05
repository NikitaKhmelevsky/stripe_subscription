class StaticPagesController < ApplicationController
  def home; end

  def pricing
    @plans = Plan.by_price
  end
end
