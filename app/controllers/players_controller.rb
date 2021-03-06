class PlayersController < ApplicationController
  before_action :set_player, only: %i[show edit update destroy]

  # GET /players
  # GET /players.json
  def index
    @players = Player.all
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html do
          redirect_to @player, notice: 'Player was successfully created.'
        end
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json do
          render json: @player.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html do
          redirect_to @player, notice: 'Player was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json do
          render json: @player.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html do
        redirect_to players_url, notice: 'Player was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_player
    @player = Player.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def player_params
    params.require(:player).permit(:island, :name, :nickname, :friend_code,
                                   :dodo_code)
  end
end
