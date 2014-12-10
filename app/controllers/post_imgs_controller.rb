class PostImgsController < ApplicationController
  before_action :set_post_img, only: [:show, :edit, :update, :destroy]

  # GET /post_imgs
  # GET /post_imgs.json
  def index
    @post_imgs = PostImg.all
  end

  # GET /post_imgs/1
  # GET /post_imgs/1.json
  def show
  end

  # GET /post_imgs/new
  def new
    @post_img = PostImg.new
  end

  # GET /post_imgs/1/edit
  def edit
  end

  # POST /post_imgs
  # POST /post_imgs.json
  def create
    @post_img = PostImg.new(post_img_params)

    respond_to do |format|
      if @post_img.save
        format.html { redirect_to @post_img, notice: 'Post img was successfully created.' }
        format.json { render :show, status: :created, location: @post_img }
      else
        format.html { render :new }
        format.json { render json: @post_img.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_imgs/1
  # PATCH/PUT /post_imgs/1.json
  def update
    # If class to use json
    # if params[:image]
    #   params[:image] = decode_base64
    # end
    respond_to do |format|
      if @post_img.update(post_img_params)
        format.html { redirect_to @post_img, notice: 'Post img was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_img }
      else
        format.html { render :edit }
        format.json { render json: @post_img.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_imgs/1
  # DELETE /post_imgs/1.json
  def destroy
    @post_img.destroy
    respond_to do |format|
      format.html { redirect_to post_imgs_url, notice: 'Post img was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_img
      @post_img = PostImg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_img_params
      params.require(:post_img).permit(:post_id, :image)
    end

    def decode_base64
      # decode base64 string
      # puts Rails.logger.info 'decoding base64 file'
      decoded_data = Base64.decode64(params[:image][:base64])
      # create 'file' understandable by Paperclip
      data = StringIO.new(decoded_data)
      data.class_eval do
        attr_accessor :content_type, :original_filename, :file_size
      end

      # set file properties
      data.content_type = params[:image][:filetype]
      data.original_filename = params[:image][:filename]
      data.file_size = params[:image][:filesize]

      # return data to be used as the attachment file (paperclip)
      data
    end
end
