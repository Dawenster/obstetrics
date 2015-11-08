class ArticlesController < ApplicationController
  def index
    @articles = Article.order("title ASC")
  end

  def show
    
  end

  def new
    @article = Article.new
  end

  def create
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end
end