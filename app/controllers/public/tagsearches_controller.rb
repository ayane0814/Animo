class Public::TagsearchesController < ApplicationController
  def search
    @model = Post
    @word = params[:content]
    @posts = Post.joins(:tags).where("tags.name LIKE?", "%#{@word}%")
    render "public/tagsearches/search"
  end
end
