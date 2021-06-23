class HomesController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  
  def top
    @articles = Article.last(4)
    @places = Place.all
  end
  
end
