class SplashController < ApplicationController
  def index
    if logged_in?
      redirect_to :controller => 'read', :action => 'index'
    end
    puts "CUREENT URL:: " + request.env['PATH_INFO']
    if request.env['PATH_INFO'] == '/login'
      redirect_to '/#/login'
    end
  end
end