class SortsController < ApplicationController
  def sort
    @updown = params["updown"]
    @articles = sort_for(@updown)
  end
  
  # ソート機能やり方は検索機能と同じ、orderメソッドで降順、昇順が選べる
  # ASCが昇順「1、2、3、・・」、DESCが降順「10、9、8・・・」
  def sort_for(updown)
    if updown == "いいねが多い順"
       Article.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
    elsif updown == "投稿日が新しい順"
       Article.order(created_at: :desc)
    else
       Article.order(created_at: :asc)
    end
  end
end
