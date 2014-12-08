class HomeController < ApplicationController
  def index
  	@tutorials = Tutorial.order("created_at DESC")
  end
end
