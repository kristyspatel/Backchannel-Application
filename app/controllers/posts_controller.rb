class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def search
    search_type = params[:search_type]
    if search_type.eql?'1'   #search by category
      @categories = Category.where("UPPER(category) LIKE '%#{params[:q].upcase}%'")
      @posts = Post.order("weight DESC").find_all_by_category_id(@categories)
    end

    if search_type.eql?'2'   #search by category
      @posts=Post.order("weight DESC").where("UPPER(tag) LIKE '%#{params[:q].upcase}%'")
    end

    if search_type.eql?'3'
       @posts = []
        @posts.concat(Post.where("UPPER(post_desc) LIKE '%#{params[:q].upcase}%'"))
        @comments = Comment.where("UPPER(comment_desc) LIKE '%#{params[:q].upcase}%'")
        @comments.each do |comment|
          @posts.push(Post.find(comment.post))
        end
       @posts.sort{|x,y| y.weight <=> x.weight}
       @posts.inspect
    end

    if search_type.eql?'4'
      @users= User.where("UPPER(first_name) LIKE '%#{params[:q].upcase}%' OR UPPER(last_name) LIKE '%#{params[:q].upcase}%'")
      @posts = Post.order("weight DESC").find_all_by_user_id(@users)

    end

  end


  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @comment_likes = {}
    @comments = Comment.find_all_by_post_id(@post)
    @comments.each do |comment|
      @comment_likes[comment.id] = CommentVote.find_by_comment_id_and_user_id(comment,current_user)
    end
    @comment = Comment.new
    @likes = PostVote.find_all_by_post_id(@post).count
    @has_liked = PostVote.find_by_user_id_and_post_id(current_user,@post)
     respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  def report
    if !params[:from_date].nil? && !params[:to_date].nil?
      from_month = params[:from_date].fetch('date(2i)')
      from_day = params[:from_date].fetch('date(3i)')
      from_year = params[:from_date].fetch('date(1i)')
      to_month = params[:to_date].fetch('date(2i)')
      to_day = params[:to_date].fetch('date(3i)')
      to_year = params[:to_date].fetch('date(1i)')
      from_date= Date.strptime("{ #{from_month}, #{from_day}, #{from_year} }", "{ %m, %d, %Y }")
      to_date= Date.strptime("{ #{to_month}, #{to_day}, #{to_year} }", "{ %m, %d, %Y }")
      puts
      @posts = Post.order('weight DESC').where(:post_date => (from_date..to_date))
      puts "kristy"
      puts @posts
      respond_to do |format|
        format.html # report.html.erb
        format.json { render json: @post }
      end
    end

  end


  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new
    has_errors=false
    if params[:post][:category_id] == ""
      @post.errors.add(:category,message="Please select a Category")
      has_errors = true
    end
    if params[:post][:post_desc] == ""
      @post.errors.add(:post_desc,message="Please write some post description")
      has_errors = true
    end

    if has_errors
      respond_to do |format|
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    else
      @category = Category.find(params[:post][:category_id])
      @post = Post.new(params[:post].except(:category_id))
      @post.user = current_user
      @post.category = @category
      @post.weight = getMaxWeight(1000) +1
      @post.save
      respond_to do |format|
        format.html { redirect_to '/welcome', notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      end

    end
    end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    @post.category = Category.find(params[:post][:category_id])
    @post.update_attribute(:category_id,@category)

    respond_to do |format|
      if @post.update_attributes(params[:post].except(:category_id))
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to '/welcome' }
      format.json { head :no_content }
    end
  end
end
