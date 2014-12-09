class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET posts/recent
  def recent
  	user = User.find(session[:user_id])
  	@followed_user_ids = Array.new
  	user.follows.each do |user|
  		@followed_user_ids.push(user.id)
  	end
  	@followed_recent_posts = (Post.order('created_at DESC').limit(10).where(:user_id => @followed_user_ids))
  end

  def top
    user = User.where(:city => current_user.city, :country => current_user.country)
    user.each do |user|
      @top_id.push(user.id)
    @post = Post.where(:user_id => @top_id ,:topic =>current_post.topic, :tag => current_tag)
    @top_posts = (Post.order('num_recommends + bookmarkeds + read DESC').limit(4))
    end
  end

  # GET /posts/new
  def new
	if logged_in?
		@post = Post.new
	else
		#do something?
	end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
  	if logged_in?
      respond_to do |format|
        if @post.save
          format.html { redirect_to @post, notice: 'Post was successfully created.' }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if logged_in?
	  respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :title, :content, :created_at, :num_recommends, :topic, :image)
    end
end
