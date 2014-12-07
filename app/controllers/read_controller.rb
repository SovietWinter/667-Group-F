class ReadController < ApplicationController
  def index
    if !logged_in?
      redirect_to '/welcome/'
    end
  end
end