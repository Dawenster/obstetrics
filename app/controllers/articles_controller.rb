class ArticlesController < ApplicationController
  def index
    @articles = Article.order("title ASC")
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article successfully created!"
      redirect_to articles_path
    else
      flash.now[:alert] = @article.errors.full_messages.to_sentence
      render "new"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.assign_attributes(article_params)
    if @article.save
      flash[:notice] = "Article successfully saved!"
      redirect_to articles_path
    else
      flash.now[:alert] = @article.errors.full_messages.to_sentence
      render "edit"
    end
  end

  def destroy
    
  end

  def article_params
    params.require(:article).permit(
      :title,
      :content
    )
  end
end