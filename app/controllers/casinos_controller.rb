class CasinosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_casino, only: %i[ show edit update destroy ]

  def index
    @casinos = Casino.all
  end

  def show
    @client = OpenWeatherMap::API.new(Rails.application.credentials[:open_weather_api_key], 'en', 'metric')
    @client = @client.current([@casino.longitude, @casino.latitude])
    @weather = @client.weather_conditions
  end

  def new
    @casino = Casino.new
  end

  def create
    @casino = Casino.new(casino_params)

    respond_to do |format|
      if @casino.save
        format.html { redirect_to @casino, notice: "Casino was successfully added." }
        format.json { render :show, status: :created, location: @casino }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @casino.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def destroy
    @casino.destroy
    respond_to do |format|
      format.html { redirect_to casinos_url, notice: "Casino was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  def set_casino
    @casino = Casino.find(params[:id])
  end
  
  def casino_params
    params.require(:casino).permit(:name, :address, :latitude, :longitude, :active, :image, :street_number, :street, :city, :state, :postcode, :country)
  end
end