class ArticlesController < ApplicationController
  def index
    @major_sections = MajorSection.rank(:row_order).all
    @articles = Article.rank(:row_order).all
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
      redirect_to article_path(@article)
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
      redirect_to article_path(@article)
    else
      flash.now[:alert] = @article.errors.full_messages.to_sentence
      render "edit"
    end
  end

  def drag_update
    respond_to do |format|
      @article = Article.find(params[:article_id])
      @article.update_attribute :row_order_position, params[:index]
      format.json { render :json => { :status => "success" } }
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    flash[:notice] = "Article successfully deleted!"
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(
      :title,
      :content,
      :major_section_id,
      :minor_section_id
    )
  end
end