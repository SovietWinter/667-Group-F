class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /follow/:id
  def follow
    if logged_in?
      #check if record already exists
      if Following.where(:user_id => current_user.id, :follow_id => params[:id]).present?
        Following.where(:user_id => current_user.id, :follow_id => params[:id]).destroy
      else
        #if doesn't exist, add
        current_user = User.find(session[:user_id])
        following = Following.create(user_id: current_user.id, follow_id: params[:id])
        following.save
      end
    end
  end

  # GET /users/follow
  def follow_list
    if logged_in?
      @user = User.find(session[:user_id])
      @following_list = @user.follows
      @follower_list = @user.followers
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    puts "\n\nPARAMS" + params.to_json
    puts "\n\nFILTERED PARAMS" + user_params.to_json
    @user = User.new(user_params)
    puts "\n\nPRE SAVE PASS:" + @user.to_json

    if @user.save
      #If successful, login as new registered user
      log_in @user
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :real_name, :prof_pic, :blog_name, :city, :country)
    end
end
