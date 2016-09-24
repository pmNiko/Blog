class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    authorize Article
    @articles = Article
        .search(params[:search])
        .paginate(:page => params[:page], :per_page => 5)
        .order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
    authorize @article
  end

  def new
    authorize Article
    @article = Article.new
    @categories = Category.all
  end

  def create
    @article = Article.new(article_params)
    @article.author = current_user
    authorize @article

    begin
      @article.save!
      redirect_to @article
    rescue ActiveRecord::RecordInvalid
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
    @categories = Category.all
    authorize @article
  end

  def update
    @article = Article.find(params[:id])
    authorize @article

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    #redirect_if_not_author(@article)
    #return if performed?
    authorize @article

    @article.destroy
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, :name, :category_ids => [])
    end

    def redirect_if_not_author(article)
      if article.author != current_user
        flash[:alert] = 'You are not authorized to perform this action.'
        redirect_to @article
      end
    end

end
