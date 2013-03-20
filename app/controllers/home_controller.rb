class HomeController < ApplicationController
  def index
    if @auth
      @banks = @auth.banks
    end
  end
end