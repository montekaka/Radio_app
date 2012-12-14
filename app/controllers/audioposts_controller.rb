class AudiopostsController < ApplicationController
  # GET /audioposts
  # GET /audioposts.json
  def index
    @audioposts = Audiopost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @audioposts }
    end
  end

  # GET /audioposts/1
  # GET /audioposts/1.json
  def show
    @audiopost = Audiopost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @audiopost }
    end
  end

  # GET /audioposts/new
  # GET /audioposts/new.json
  def new
    @audiopost = Audiopost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @audiopost }
    end
  end

  # GET /audioposts/1/edit
  def edit
    @audiopost = Audiopost.find(params[:id])
  end

  # POST /audioposts
  # POST /audioposts.json
  def create
    @audiopost = Audiopost.new(params[:audiopost])

    respond_to do |format|
      if @audiopost.save
        format.html { redirect_to @audiopost, :notice => 'Audiopost was successfully created.' }
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
    @audiopost = Audiopost.find(params[:id])

    respond_to do |format|
      if @audiopost.update_attributes(params[:audiopost])
        format.html { redirect_to @audiopost, :notice => 'Audiopost was successfully updated.' }
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
    @audiopost = Audiopost.find(params[:id])
    @audiopost.destroy

    respond_to do |format|
      format.html { redirect_to audioposts_url }
      format.json { head :ok }
    end
  end
end
