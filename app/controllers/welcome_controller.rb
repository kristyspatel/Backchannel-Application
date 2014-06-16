class WelcomeController < ApplicationController
  def index
    @posts = Post.order("weight DESC").all
     @post_votes ={}
    @no_of_votes ={}
    @no_of_comments={}
    @posts.each do |post|
      @post_votes[post] = has_liked(post)
      @no_of_votes[post] = likes_on_post(post).count;
      @no_of_comments[post] = comments_on_post(post).count;
    end

  end

  def has_liked(post)
    has_liked = false
    likes_on_post(post).each do |likes|
      if likes.user == current_user
        has_liked = true
        break
      end
    end
    has_liked
  end

  def likes_on_post(post)
    @post = Post.find(post.id)
    @likes_on_post = PostVote.find_all_by_post_id(@post)
    @likes_on_post
  end

  def comments_on_post(post)
    @post = Post.find(post.id)
    @comments_on_post = Comment.find_all_by_post_id(@post)
    @comments_on_post
  end

end
