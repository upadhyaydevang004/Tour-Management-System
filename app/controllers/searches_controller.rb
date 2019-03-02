class SearchesController < ApplicationController


  # GET /searches
  # GET /searches.json

  # GET /searches/1
  # GET /searches/1.json
  def show
    @search = Search.find(params[:id])
  end

  # GET /searches/new
  def new
    @search = Search.new
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  # PATCH/PUT /searches/1
  # PATCH/PUT /searches/1.json

  # private
    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:itinerary,:name,:min_price,:max_price,:seats,:start_date_from, :start_date_to)
    end
end
