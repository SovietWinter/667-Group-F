class ReadController < ApplicationController
  def index
    if request.env['PATH_INFO'] == '/home'
      redirect_to '/#/home'
    end
  end
end