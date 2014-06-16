class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new
    @comment.post = Post.find(params[:post_id])


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    puts params[:comment].inspect
    @comment = Comment.new(params[:comment].except(:post))
    @comment.user = current_user
    @comment.post = Post.find(params[:comment][:post])
    boostPostWeight(Post.find(params[:comment][:post]),5)
    decayWeight(Post.find(params[:comment][:post]),2.5)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@comment.post), notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { redirect_to post_path(@comment.post)}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    @comment.update_attribute(:post,Post.find(params[:comment][:post]))
    @comment.update_attribute(:user,current_user)

    respond_to do |format|
      if @comment.update_attributes(params[:comment].except(:post,:user))
        format.html { redirect_to post_path(params[:comment][:post]), notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    boostPostWeight(@post,-5)
    decayWeight(@post,-2.5)
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.json { head :no_content }
    end
  end
end
