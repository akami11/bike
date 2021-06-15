class LikesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    like = @article.likes.new(user_id: current_user.id)
    like.save
    redirect_to article_path(@article.id)  
  end
  

  def destroy
    @article = Article.find(params[:article_id])
    like = @article.likes.find_by(user_id: current_user.id)
    like.destroy
    redirect_to article_path(@article.id)  
  end
end
