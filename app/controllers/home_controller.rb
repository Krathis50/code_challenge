class HomeController < ApplicationController
  def index
  end

  def submit
    code = params[:code]
    language = params[:language].to_sym
    result = CodeEvaluator.evaluate_for(language, code)
    redirect_to root_url, notice: "Evaluated #{ language }. The result of the code is #{ result }"
  end
end
