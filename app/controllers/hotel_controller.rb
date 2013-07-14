class HotelController < ApplicationController
  def show
    @hotel = Hotel.find(params[:id])
    @comments = @hotel.comments
  end

  def index
    @hotel = Hotel.all
  end

  before_filter :authenticate_user!
  def create
    @hotel = Hotel.new(params[:hotel])
    @hotel.userRateCount = 0
    @hotel.rating = 0
    if @hotel.save
      flash[:notice] = "Successfully created new Hotel."
      redirect_to @hotel
    else
      render :action => 'new'
    end
  end



  def new
    @hotel = Hotel.new
  end

end
