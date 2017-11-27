class CountriesController < ApplicationController
  before_action :set_country, only: [:show]

  # GET /countries
  def index
    @countries = Country.all.order('name ASC')

    render json: @countries
  end

  # GET /countries/1
  def show
    render json: @country
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

end
