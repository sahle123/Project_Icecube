class LevelsController < ApplicationController
  # GET /levels
  # GET /levels.json
  def index
    @filter = (params[:filter] != nil)? params[:filter] : "title"
    @restrictions = restrictionType
    @levels = Level.find(:all, :order => @filter, :conditions => @restrictions )
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @levels }
    end
  end
  def restrictionType
    temp = [ "restriction_time > ? or restriction_move > ?", 0, 0 ]
    case params[:restrictions]
      when 'All'
        temp = [ "restriction_time > ? or restriction_move > ?", 0, 0 ]
      when 'Both'
        temp = [ "restriction_time > ? and restriction_move > ?", 0, 0 ]
      when "restriction_move"
        temp = [ "restriction_move > ? and restriction_time == ?", 0, 0 ]
      when "restriction_time"
        temp = [ "restriction_move == ? and restriction_time > ?", 0, 0 ]
      else
        temp = [ "restriction_time == ? and restriction_move == ?", 0, 0 ]
    end
    temp
  end
  # GET /levels/1
  # GET /levels/1.json
  def show
    @level = Level.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @level }
    end
  end

  # GET /levels/new
  # GET /levels/new.json
  def new
    @level = Level.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @level }
    end
  end

  # GET /levels/1/edit
  def edit
    @level = Level.find(params[:id])
  end

  # POST /levels
  # POST /levels.json
  def create
    @level = Level.new(params[:level])

    respond_to do |format|
      if @level.save
        format.html { redirect_to @level, notice: 'Level was successfully created.' }
        format.json { render json: @level, status: :created, location: @level }
      else
        format.html { render action: "new" }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /levels/1
  # PUT /levels/1.json
  def update
    @level = Level.find(params[:id])

    respond_to do |format|
      if @level.update_attributes(params[:level])
        format.html { redirect_to @level, notice: 'Level was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /levels/1
  # DELETE /levels/1.json
  def destroy
    @level = Level.find(params[:id])
    @level.destroy

    respond_to do |format|
      format.html { redirect_to levels_url }
      format.json { head :ok }
    end
  end
end
