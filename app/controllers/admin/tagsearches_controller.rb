class Admin::TagsearchesController < ApplicationController
  def search
    @model = Post
    @word = params[:content]
    @posts = Post.joins(:tags).where("tags.name LIKE?", "%#{@word}%")
    render "admin/tagsearches/search"
  end
end
