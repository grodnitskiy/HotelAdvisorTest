class HotelController < ApplicationController
  def show
    @hotel = Hotel.find(params[:id])
    @comments = @hotel.comments
  end

  def show_new

  end

  def show_most_rated
    @hotels = Hotel
  end

  def index

  end

  def create
    @hotel = Hotel.new(params[:hotel])
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


  def edit
    @hotel = Hotel.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:id])
    if @hotel.update_attributes(params[:painting]) #TODO: rewrite
      flash[:notice] = "Successfully updated Hotel."
      redirect_to @hotel
    else
      render :action => 'edit'
    end
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
    flash[:notice] = "Successfully destroyed Hotel."
    redirect_to @hotel
  end

end
