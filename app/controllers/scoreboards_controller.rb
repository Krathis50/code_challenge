include Devise::Controllers::Helpers

class ScoreboardsController < ApplicationController
  before_action :set_scoreboard, only: [:show, :edit, :update, :destroy]

  # GET /scoreboards
  # GET /scoreboards.json
  def index
    @scoreboard = Scoreboard.all
    @users = User.all
    @printscore = 0
    i = 0
    @users.each do |s| 
      puts "printing user id"
      puts s.id
      max = s.scoreboard_score
      while i <= max.length
          addthis = s.scoreboard_score[i+1].to_s
          #puts "printing addthis"
          #puts s.scoreboard_score[i+1].to_s
          addthis = addthis.to_i
          #puts addthis
          @printscore = addthis + @printscore
          i += 1
      end
      s.update_attribute(:print_score, @printscore.to_s)
      @printscore = 0
      i=0
    end
  end

  # GET /scoreboards/1
  # GET /scoreboards/1.json
  def show
    @scoreboard = Scoreboard.all
    @users = User.all
    max = Challenge.map(&:id).max

    for i in max do
      puts i
    end

  end

  # GET /scoreboards/new
  def new
    @scoreboard = Scoreboard.new
  end

  # GET /scoreboards/1/edit
  def edit
  end

  # POST /scoreboards
  # POST /scoreboards.json
  def create
    @scoreboard = Scoreboard.new(scoreboard_params)

    respond_to do |format|
      if @scoreboard.save
        format.html { redirect_to @scoreboard, notice: 'Scoreboard was successfully created.' }
        format.json { render :show, status: :created, location: @scoreboard }
      else
        format.html { render :new }
        format.json { render json: @scoreboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scoreboards/1
  # PATCH/PUT /scoreboards/1.json
  def update
    respond_to do |format|
      if @scoreboard.update(scoreboard_params)
        format.html { redirect_to @scoreboard, notice: 'Scoreboard was successfully updated.' }
        format.json { render :show, status: :ok, location: @scoreboard }
      else
        format.html { render :edit }
        format.json { render json: @scoreboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scoreboards/1
  # DELETE /scoreboards/1.json
  def destroy
    @scoreboard.destroy
    respond_to do |format|
      format.html { redirect_to scoreboards_url, notice: 'Scoreboard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scoreboard
      @scoreboard = Scoreboard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scoreboard_params
      params.require(:scoreboard).permit(:scoreboard_name,:scoreboard_school,:scoreboard_score)
    end
end
