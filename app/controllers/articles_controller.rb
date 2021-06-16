class ArticlesController < ApplicationController
   before_action :ensure_article, only: [:edit, :show, :update, :destroy]
  
  
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    @places = Place.all
  end
  
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save!
      redirect_to articles_path
    else
     @places = Place.all
     render :new
    end
  end
  
  
  def edit
    @places = Place.all
  end

  def show
    @comment = Comment.new
    @tags = @article.tag_counts_on(:tags) 
  end
  
  def update
    if @article.update(article_params)
      redirect_to articles_path
    else
      render :edit
    end
  end
  
  def destroy
    @article.destroy
    redirect_to articles_path
  end
  
  
  private
  
  def article_params
    params.require(:article).permit(:title, :body, :user_id, :place_id, :video, :tag_list, {images: []}) 
  end
  
  def ensure_article
    @article = Article.find(params[:id])
  end
  
end
