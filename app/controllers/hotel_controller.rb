class HotelController < ApplicationController
   def show
     @hotel = Hotel.find(params[:id])
   end

   def index

   end

  def create
    @hotel = Hotel.new(params[:hotel])
    if @hotel.save
      flash[:notice] = "Successfully created Hotel."
      redirect_to @hotel
    else
      render :action => 'new'
    end
  end

  def new
    @hotel = Hotel.new
  end


  def edit
    @painting = Painting.find(params[:id])
  end

  def update
    @painting = Painting.find(params[:id])
    if @painting.update_attributes(params[:painting])
      flash[:notice] = "Successfully updated painting."
      redirect_to @painting.gallery
    else
      render :action => 'edit'
    end
  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy
    flash[:notice] = "Successfully destroyed painting."
    redirect_to @painting.gallery
  end
end
