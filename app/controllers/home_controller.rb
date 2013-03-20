class HomeController < ApplicationController
  def index
    @banks = @auth.banks
  end
end