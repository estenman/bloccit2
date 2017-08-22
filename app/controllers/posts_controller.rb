class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
  end

  def new
  end

  def edit(posts)
    clean_array =[]
    posts.each_with_index do |title, index|
      if index % 5 == 0
        clean_array.push("SPAM")
      else
        clean_array.push(title)
      end
    end
    clean_array
  end

end
