class ReadProgressController < ApplicationController
  def create
    if logged_in?
		#check if record already exists
		if ReadProgress.where(:post_id => params[:post_id], :user_id => current_user.id).present?
			#do nothing
		else
			#if doesn't exist, add
			read_progress = ReadProgress.create(user_id: current_user.id, post_id: params[:post_id], progress: 0, completed: false)
			respond_to do |format|
			  if read_progress.save
			    format.json { render :show, status: :created, location: read_progress}
			  else
			    format.json { render json: @read_progress.errors, status: :unprocessable_entity }
			  end
			end
		end
	 end
  end
  
  #Used to update :progress int
  def update_progress
    if logged_in?
      find_record(params[:post_id])
      @read_progress.update(progress: param[:progress])
    end
  end
	
  #Used to update :completed boolean
  def update_status
    if logged_in?
	  find_record(params[:post_id])
	  @read_progress.update(completed: param[:completed])
    end
  end
  
  def find_record(post_id)
	if ReadProgress.where(:post_id => post_id, :user_id => current_user.id).present?
		@read_progress = ReadProgress.where(:post_id => post_id, :user_id => current_user.id)
	end
  end
end
