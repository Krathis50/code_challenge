class HomeController < ApplicationController
  def index
  end

  def submit
    code = params[:rubyCode]
    result = eval(code)
    redirect_to root_url, notice: "The result of the code is #{ result }"
  end
end
