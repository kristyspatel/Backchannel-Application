class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.find_all_by_is_active(true)
    puts "hey" + @users.to_s
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  #GET /user_sign_up
  def user_sign_up
    @user = User.new
  end


  def signin
    respond_to do |format|
      format.html
    end
  end

  def authenticate_user

    @user = User.find_by_unity_id(params[:login][:unity_id])
    puts @user.inspect
    puts "kp"
    if @user && @user.authenticate(params[:login][:password])
      sign_in(@user)
      flash[:notice] = 'User successfully created.'
      respond_to do |format|
        format.html { redirect_to('/welcome') }
      end
    else
      flash[:error] = 'Invalid email/password combination'
      render 'signin'
    end
  end

  def logout
    sign_out
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end

  end

  def create_user
    @user = User.new(params[:user])
    if(!current_user.nil?)
      @user.role = 'A'
    else
      @user.role = 'U'
    end
    if (@user.save)
      if(current_user.nil?)
        sign_in(@user)
      end
      flash[:notice] = 'User successfully created.'
      respond_to do |format|
        format.html { redirect_to('/welcome') }
      end
    else
      respond_to do |format|
        format.html { render action: "user_sign_up" }
      end
    end

  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.password = params[:user]["password"]
    @user.role = 'U'
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else

        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    if @user.role == 'S'
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'Super User cannot be deleted' }
        format.json { head :no_content }
      end
    else
      @user.update_attribute(:unity_id,"Anonymous")
      @user.update_attribute(:first_name,"Anonymous")
      @user.update_attribute(:last_name, "User")
      @user.update_attribute(:role,'U')
      @user.update_attribute(:is_active, false)
      respond_to do |format|
        format.html { redirect_to users_url }
        format.json { head :no_content }
      end
    end
  end
end
