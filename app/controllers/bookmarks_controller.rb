class BookmarksController < ApplicationController
  def create
	if logged_in?
		#check if record already exists
		if bookmarked?(params[:post_id])
			#do nothing
		else
			#if doesn't exist, add
			bookmark = Bookmarking.create(user_id: current_user.id, post_id: params[:post_id])
			if bookmark.save
				format.json { render :show, status: :created, location: bookmark}
			else
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end
  end
  def destroy
  	if logged_in?
      bookmark = Bookmarking.where(:user_id => current_user.id, :post_id => params[:post_id])
      bookmark.destroy_all
    end
  end
  
 private
    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_params
      params.require(:bookmarking).permit(:post_id)
    end
end
