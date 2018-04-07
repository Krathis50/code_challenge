class HomeController < ApplicationController
  def index
  end

  def submit
    code = params[:rubyCode]
    result = eval(code)
    if result.instance_eval(code)
      redirect_to root_url, notice: "The result of the code is #{ result }"
    else
      redirect_to root_url, notice: "Cannot be left blank or error in code #{code}"
    end
  end
  
end
