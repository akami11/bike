class SearchsController < ApplicationController
  
  def search
    @content = params["content"]
    @records = search_for(@content)
  end

  private
  
  def search_for(content)
      Article.where("title LIKE ?", "%"+content+"%")
  end

end
