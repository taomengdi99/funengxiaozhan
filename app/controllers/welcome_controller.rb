class WelcomeController < ApplicationController
  def index
    flash[:alert] = "我怎么才来啊？花都谢了"
  end
end
