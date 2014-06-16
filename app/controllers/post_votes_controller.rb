class PostVotesController < ApplicationController
  # GET /post_votes
  # GET /post_votes.json

  def like_post
    @post = Post.find(params[:post_id])
    boostPostWeight(@post,10)
    decayWeight(@post,5)
    @post_vote = PostVote.new
    @post_vote.post = @post
    puts current_user.first_name
    @post_vote.user = current_user
    @post_vote.save
    respond_to do |format|
      format.html { redirect_to '/welcome'}
    end
  end

  def unlike_post
    @post = Post.find(params[:post_id])
    boostPostWeight(@post,-10)
    decayWeight(@post,-5)
    @unlike_post = PostVote.find_by_post_id_and_user_id(@post,current_user)
    @unlike_post.destroy
    respond_to do |format|
      format.html { redirect_to '/welcome'}
    end
  end


  def index
    @post_votes = PostVote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @post_votes }
    end
  end

  # GET /post_votes/1
  # GET /post_votes/1.json
  def show
    @post_vote = PostVote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post_vote }
    end
  end

  # GET /post_votes/new
  # GET /post_votes/new.json
  def new
    @post_vote = PostVote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post_vote }
    end
  end

  # GET /post_votes/1/edit
  def edit
    @post_vote = PostVote.find(params[:id])
  end

  # POST /post_votes
  # POST /post_votes.json
  def create
    @post_vote = PostVote.new(params[:post_vote])

    respond_to do |format|
      if @post_vote.save
        format.html { redirect_to @post_vote, notice: 'Post vote was successfully created.' }
        format.json { render json: @post_vote, status: :created, location: @post_vote }
      else
        format.html { render action: "new" }
        format.json { render json: @post_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /post_votes/1
  # PUT /post_votes/1.json
  def update
    @post_vote = PostVote.find(params[:id])

    respond_to do |format|
      if @post_vote.update_attributes(params[:post_vote])
        format.html { redirect_to @post_vote, notice: 'Post vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_votes/1
  # DELETE /post_votes/1.json
  def destroy
    @post_vote = PostVote.find(params[:id])
    @post_vote.destroy

    respond_to do |format|
      format.html { redirect_to post_votes_url }
      format.json { head :no_content }
    end
  end
end
