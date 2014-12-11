class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  wrap_parameters :user, include: [:username, :email, :password, :password_confirmation, :prof_pic, :real_name, :blog_name, :city, :country]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # POST /follow/:id
  def follow
    if logged_in?
      #check if record already exists
      if Following.where(:user_id => current_user.id, :follow_id => params[:id]).present?
        render json: {"ehh" => true}
      else
        #if doesn't exist, add
        current_user = User.find(session[:user_id])
        following = Following.create(user_id: current_user.id, follow_id: params[:id])
        following.save
        render json: {status: '201'}
      end
    end
  end

  def unfollow
    if logged_in?
      #check if record already exists
      if Following.where(:user_id => current_user.id, :follow_id => params[:id]).present?
        rel = Following.where(:user_id => current_user.id, :follow_id => params[:id])
        rel.destroy_all
        render json: {status: 'ok'}
      else
        render json: @errors
      end
    end
  end

  def isfollowing
    if Following.where(:user_id => current_user.id, :follow_id => params[:id]).present?
      render json: {status: '200'}
    else
      puts "not following"
    end
  end

  # GET /users/follow
  def follow_list
    if logged_in?
      @user = User.find(session[:user_id])
      @following_list = @user.follows
      @follower_list = @user.followers
      render json: [@follower_list, @following_list]
    end
  end

  def current
    @user = current_user
  end

  def bookmarks
    b = current_user.bookmarkings
    @posts = []
    for p in b
      @posts.push Post.find(p.post_id)
    end
    render json: @posts
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
    @user = User.new(user_params)

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
    if params[:user][:prof_pic]
      params[:user][:prof_pic] = decode_base64
    end
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
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

    def decode_base64
      # decode base64 string
      # puts Rails.logger.info 'decoding base64 file'
      decoded_data = Base64.decode64(params[:user][:prof_pic][:base64])
      # create 'file' understandable by Paperclip
      data = StringIO.new(decoded_data)
      data.class_eval do
        attr_accessor :content_type, :original_filename, :file_size
      end

      # set file properties
      data.content_type = params[:user][:prof_pic][:filetype]
      data.original_filename = params[:user][:prof_pic][:filename]
      data.file_size = params[:user][:prof_pic][:filesize]

      # return data to be used as the attachment file (paperclip)
      data
    end
end
