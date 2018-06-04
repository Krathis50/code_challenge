class ChallengesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  after_action :set_csrf_headers, only: :create
  respond_to :json
  $result = ""


  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = Challenge.all
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show    
    @challenge = Challenge.find(params[:id])
    @givenproblem = ProblemSet.all
    max = @givenproblem.map(&:id).max
    @givenproblem = ProblemSet.find(rand(1..max))
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
  end

  # GET /challenges/1/edit
  def edit
  end

  # POST /challenges
  # POST /challenges.json
  def create
    @challenge = Challenge.new(challenge_params)

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to @challenge, notice: 'Challenge was successfully created.' }
        format.json { render :show, status: :created, location: @challenge }
      else
        format.html { render :new }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenges/1
  # PATCH/PUT /challenges/1.json
  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
        format.json { render :show, status: :ok, location: @challenge }
      else
        format.html { render :edit }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challenge.destroy
    respond_to do |format|
      format.html { redirect_to challenges_url, notice: 'Challenge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def submit
    # This will find the id of the challenge.
    challenge = Challenge.find(params[:challenge_id])
    puts "Testing if args got its data.".split(',')
    usrArgs = params[:usrInput]
    puts usrArgs
    # This will find the id of the problemset.
    problem = ProblemSet.find(params[:problem_id])
    puts problem
    # retrieve the code that was passed in the parameter.
    code = params[:code]
    language = params[:language].to_sym
    # Evaluate the code passed in.
    $result = CodeEvaluator.evaluate_for(language, code, usrArgs)
    # Here we get the answer from problem and put it into panswer.
    puts "sleeping"
    puts $result

    #redirect_to challenge_path(challenge), notice: "Evaluated #{ language }. The result of the code is [ #{ result } ] #{msgender}"
  end

  def getoutput
    puts "I'M IN HERE"
    thedata = $result
    puts "Outputting."
    puts @result
    respond_to do |format|
      format.json {render json: thedata.to_json}
  end

end
  protected
    def set_csrf_headers
      if request.xhr?
        # Add the newly created csrf token to the page headers
        # These values are sent on 1 request only
        response.headers['X-CSRF-Token'] = "#{form_authenticity_token}"
        response.headers['X-CSRF-Param'] = "#{request_forgery_protection_token}"
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_params
      params.require(:challenge).permit(:name, :description, :pdescription)
    end
end
