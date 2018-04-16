class ProblemSetsController < ApplicationController
  before_action :set_problem_set, only: [:edit, :update, :destroy]

  # GET /problem_sets
  # GET /problem_sets.json
  def index
    @problem_sets = ProblemSet.all
  end

  # GET /problem_sets/new
  def new
    challenge_id = params[:challenge_id]
    @problem_set = ProblemSet.new(challenge_id: challenge_id)
  end

  # GET /problem_sets/1/edit
  def edit
  end

  # POST /problem_sets
  # POST /problem_sets.json
  def create
    @problem_set = ProblemSet.new(problem_set_params)

    respond_to do |format|
      if @problem_set.save
        format.html { redirect_to @problem_set.challenge, notice: 'Problem set was successfully created.' }
        format.json { render :show, status: :created, location: @problem_set }
      else
        format.html { render :new }
        format.json { render json: @problem_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /problem_sets/1
  # PATCH/PUT /problem_sets/1.json
  def update
    respond_to do |format|
      if @problem_set.update(problem_set_params)
        format.html { redirect_to @problem_set, notice: 'Problem set was successfully updated.' }
        format.json { render :show, status: :ok, location: @problem_set }
      else
        format.html { render :edit }
        format.json { render json: @problem_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problem_sets/1
  # DELETE /problem_sets/1.json
  def destroy
    @problem_set.destroy
    respond_to do |format|
      format.html { redirect_to problem_sets_url, notice: 'Problem set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_problem_set
      @problem_set = ProblemSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def problem_set_params
      params.require(:problem_set).permit(:arguments, :answer, :challenge_id)
    end
end
