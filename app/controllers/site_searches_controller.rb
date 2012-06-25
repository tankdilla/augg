class SiteSearchesController < ApplicationController
  # GET /site_searches
  # GET /site_searches.json
  def index
    @site_searches = SiteSearch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @site_searches }
    end
  end

  # GET /site_searches/1
  # GET /site_searches/1.json
  def show
    @site_search = SiteSearch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site_search }
    end
  end

  # GET /site_searches/new
  # GET /site_searches/new.json
  def new
    @site_search = SiteSearch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site_search }
    end
  end

  # GET /site_searches/1/edit
  def edit
    @site_search = SiteSearch.find(params[:id])
  end

  # POST /site_searches
  # POST /site_searches.json
  def create
    @site_search = SiteSearch.new(params[:site_search])

    respond_to do |format|
      if @site_search.save
        format.html { redirect_to @site_search, notice: 'Site search was successfully created.' }
        format.json { render json: @site_search, status: :created, location: @site_search }
      else
        format.html { render action: "new" }
        format.json { render json: @site_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /site_searches/1
  # PUT /site_searches/1.json
  def update
    @site_search = SiteSearch.find(params[:id])

    respond_to do |format|
      if @site_search.update_attributes(params[:site_search])
        format.html { redirect_to @site_search, notice: 'Site search was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_searches/1
  # DELETE /site_searches/1.json
  def destroy
    @site_search = SiteSearch.find(params[:id])
    @site_search.destroy

    respond_to do |format|
      format.html { redirect_to site_searches_url }
      format.json { head :no_content }
    end
  end
end
