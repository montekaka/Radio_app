class ShowsController < ApplicationController
  
  before_filter :authenticate_user!, :except=>[:index, :show, :categories]  
  
  # GET /station/1/shows/categories
  def categories
    @station = Station.find(params[:station_id])
  end 
  

  # GET /stations/1/shows
  # GET /stations/1/shows.json  
  
  # GET /shows
  # GET /shows.json
  def index
    if (params[:station_id])
      @station = Station.find(params[:station_id])
      if (params[:category])
        @shows = @station.shows.find_all_by_category(params[:category])
      else          
        @shows = @station.shows
      end
    else
      @shows = Show.all      
    end
    
    if !current_user
      #render :action => 'index_user', :layout => 'admin'
      respond_to do |format|
        format.html { render :action => 'index_user' }
        format.json { render :json => @shows }
      end    
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @shows }
      end    
    end 
    
  end

  # GET /shows/1
  # GET /shows/1.json
  def show
    @show = Show.find(params[:id])

    if !current_user
      #render :action => 'index_user', :layout => 'admin'
      respond_to do |format|
        format.html { render :action => 'show_user' }
        format.json { render :json => @show }
      end    
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @show }
      end      
    end   
    
  end

  # GET /shows/new
  # GET /shows/new.json
  def new
    @station = Station.find(params[:station_id])
    @show = @station.shows.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @show }
    end
  end

  # GET /shows/1/edit
  def edit
    @show = Show.find(params[:id])
  end

  # POST /shows
  # POST /shows.json
  def create
    @station = Station.find(params[:station_id])
    @show = @station.shows.new(params[:show])

    respond_to do |format|
      if @show.save
        format.html { redirect_to station_show_path(@station, @show), :notice => 'Show was successfully created.' }
        format.json { render :json => @show, :status => :created, :location => @show }
      else
        format.html { render :action => "new" }
        format.json { render :json => @show.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shows/1
  # PUT /shows/1.json
  def update
    @show = Show.find(params[:id])

    respond_to do |format|
      if @show.update_attributes(params[:show])
        format.html { redirect_to @show, :notice => 'Show was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @show.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.json
  def destroy
    @show = Show.find(params[:id])
    @show.destroy

    respond_to do |format|
      format.html { redirect_to shows_url }
      format.json { head :ok }
    end
  end
end
