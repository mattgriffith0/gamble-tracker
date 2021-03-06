class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game, only: %i[ show edit update destroy ]
  before_action :set_trip_array, only: %i[ new edit create update ]
  before_action :set_casino_array, only: %i[ new edit create update ]
  before_action :set_currency_array, only: %i[ new edit create update ]
  before_action :set_odds_array, only: %i[ new edit create update ]

  # GET /games or /games.json
  def index
    @games = Game.all
  end

  # GET /games/1 or /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
    @odds = Odd.all
  end

  # POST /games or /games.json
  def create
    @game = Game.new(game_params)
    @game.user = current_user

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: "Game was successfully created." }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: "Game was successfully updated." }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:user_id, :trip_id, :casino_id, :date, :buy_in, :cash_out, :currency_id, :odds_id)
    end

    def set_trip_array
      @trips = Trip.all
    end

    def set_odds_array
      @odds = Odd.all
    end

    def set_currency_array
      @currencies = Currency.all
    end

    def set_casino_array
      @casinos = Casino.all
    end
end
