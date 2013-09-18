class StationsController < ApplicationController

  before_filter :authenticate_user!, :only=>[:new, :create, :edit, :update]

  # GET /stations
  # GET /stations.json
  def index
    #@stations = Station.all
    
    if !current_user
      #render :action => 'index_user', :layout => 'admin'
      @stations = Station.all

      respond_to do |format|
        format.html # index.html.erb  
        format.json { render :json => @stations }
      end
    else
      @stations = current_user.stations.all
      if @stations.size == 0
        redirect_to new_station_path, :flash => { :notice => "Plese add an station to start" }
      else
        respond_to do |format|
          format.html { render :action => 'index_user' }       
          format.json { render :json => @stations }
        end      
      end
    end    
  end

  # GET /stations/1
  # GET /stations/1.json
  def show
    @station = Station.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @station }
    end
  end

  # GET /stations/new
  # GET /stations/new.json
  def new
    #@station = Station.new

    # only one station is allowed for now
    if current_user.stations.count > 0 
        redirect_to stations_url, :notice => "Only one station is allowed"
    else
      @station = current_user.stations.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @station }
      end
    end

  end

  # GET /stations/1/edit
  def edit
    #@station = Station.find(params[:id])
    @station = current_user.stations.find(params[:id])
  end

  # POST /stations
  # POST /stations.json
  def create
    #@station = Station.new(params[:station])
    @station = current_user.stations.new(params[:station])

    respond_to do |format|
      if @station.save
        #format.html { redirect_to new_station_show_path(@station), :notice => 'Station was successfully created.' }
        format.html { redirect_to dropbox_main_path(:dropbox_path =>"station_show_name"), :notice => 'Show was successfully created.' }
        format.json { render :json => @station, :status => :created, :location => @station }
      else
        format.html { render :action => "new" }
        format.json { render :json => @station.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stations/1
  # PUT /stations/1.json
  def update
    #@station = Station.find(params[:id])
    @station = current_user.stations.find(params[:id])

    respond_to do |format|
      if @station.update_attributes(params[:station])
        format.html { redirect_to @station, :notice => 'Station was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @station.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    #@station = Station.find(params[:id])
    @station = current_user.stations.find(params[:id])
    @station.destroy

    respond_to do |format|
      format.html { redirect_to stations_url }
      format.json { head :ok }
    end
  end

end
