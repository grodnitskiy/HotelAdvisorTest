class HomeController < ApplicationController
  def index
    @hotel= Hotel.order("rating DESC").take(5)
  end

end
