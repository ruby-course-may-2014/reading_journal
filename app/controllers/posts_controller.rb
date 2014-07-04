class PostsController < ApplicationController
  before_filter :authorize
  def index
    @posts = Post.all
    @post = Post.new
  end  
end
