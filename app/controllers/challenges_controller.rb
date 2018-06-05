class ChallengesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  after_action :set_csrf_headers, only: :create
  respond_to :json

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
    if max != nil
      @givenproblem = ProblemSet.find(rand(1..max))
    else
    end
    @current_user ||= User.find_by(id: session[:user_id])
    session[:usercode] = ""
    session[:userinputcode] = ""
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
    #puts "Testing if args got its data.".split(',')
    usrArgs = params[:usrInput]
    #puts usrArgs
    # This will find the id of the problemset.
    problem = ProblemSet.find(params[:problem_id])
    #puts problem
    # retrieve the code that was passed in the parameter.
    code = params[:code]
    session[:userinputcode] = code
    language = params[:language].to_sym
    # Evaluate the code passed in.
    session[:usercode] = CodeEvaluator.evaluate_for(language, code, usrArgs)
    # Here we get the answer from problem and put it into panswer.
    #puts "sleeping"
    #puts session[:usercode]

    #redirect_to challenge_path(challenge), notice: "Evaluated #{ language }. The result of the code is [ #{ result } ] #{msgender}"
  end

  def getoutput
    thedata = session[:usercode]
    respond_to do |format|
      format.json {render json: thedata.to_json}
  end

  def submit_score 
    #puts "Submitting user score."
    @current_user ||= User.find_by(params[:user_id])
    @problem_answer = ProblemSet.find_by(params[:problem_id])
    puts @problem_answer.answer
    if session[:usercode] == @problem_answer.answer
      score = 10 + @current_user.scoreboard_score.to_i
      #puts score
      @current_user.update_attributes(scoreboard_score: score.to_s)
    else 
      puts "User answer did not match problem"
    end
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
