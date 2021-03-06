class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  before_filter :authenticate_user!

  def new

    @comment = Comment.new
    @comment.hotel = Hotel.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  before_filter :authenticate_user!

  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  before_filter :authenticate_user!
  def create

    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    @hotel = Hotel.find(@comment.hotel_id)

    if !@hotel.rating?
      @hotel.rating= @comment.rate
      @hotel.userRateCount =1
    else
      @hotel.rating = (((@hotel.userRateCount * @hotel.rating) + @comment.rate) / (@hotel.userRateCount + 1))
      @hotel.userRateCount += 1
    end
    @hotel.save
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.hotel, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  before_filter :authenticate_user!
  def update

    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  before_filter :authenticate_user!
  def destroy

    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
end
