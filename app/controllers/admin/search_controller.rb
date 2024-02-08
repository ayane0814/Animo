class Admin::SearchController < ApplicationController
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    
    if @model == "user"
      @redords = User.search_for(@content, @method)
    else
      @records = Posts.search_for(@content, @method)
    end
  end
end
