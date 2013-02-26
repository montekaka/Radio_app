class AudiopostsController < ApplicationController
  
  before_filter :authenticate_user!, :except=>[:index, :show]  
  before_filter :load_parent
  
  # GET /audioposts
  # GET /audioposts.json
  def index
    @audioposts = @show.audioposts.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @audioposts }
    end
  end

  # GET /audioposts/1
  # GET /audioposts/1.json
  def show
    @audiopost = @show.audioposts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @audiopost }
    end
  end

  # GET /audioposts/new
  # GET /audioposts/new.json
  def new
    @audiopost = @show.audioposts.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @audiopost }
    end
  end

  # GET /audioposts/1/edit
  def edit
    @audiopost = @show.audioposts.find(params[:id])
  end

  # POST /audioposts
  # POST /audioposts.json
  def create
    @audiopost = @show.audioposts.new(params[:audiopost])

    respond_to do |format|
      if @audiopost.save
        format.html { redirect_to show_audiopost_path(@show, @audiopost), :notice => 'Audiopost was successfully created.' }
        format.json { render :json => @audiopost, :status => :created, :location => @audiopost }
      else
        format.html { render :action => "new" }
        format.json { render :json => @audiopost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /audioposts/1
  # PUT /audioposts/1.json
  def update
    @audiopost = @show.audioposts.find(params[:id])

    respond_to do |format|
      if @audiopost.update_attributes(params[:audiopost])
        format.html { redirect_to show_audiopost_path(@show, @audiopost), :notice => 'Audiopost was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @audiopost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /audioposts/1
  # DELETE /audioposts/1.json
  def destroy
    @audiopost = @show.audioposts.find(params[:id])
    @audiopost.destroy

    respond_to do |format|
      format.html { redirect_to show_audioposts_url(@show) }
      format.json { head :ok }
    end
  end
  
  def load_parent
      @show = Show.find(params[:show_id])
  end
  
end
