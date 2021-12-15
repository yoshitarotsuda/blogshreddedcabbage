class HomesController < ApplicationController
  
  def index
    
    @articles = Article.all
    @tags = Tag.all
  end
end
