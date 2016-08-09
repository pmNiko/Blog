class ArticlesController < ApplicationController
  def index
    @articles = current_user.articles
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.author = current_user

    begin
      @article.save!
      redirect_to @article
    rescue ActiveRecord::RecordInvalid
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    begin
      @article.update!(article_params)
      redirect_to @article
    rescue ActiveRecord::RecordInvalid
      render 'edit'
    end
  end



  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

end
