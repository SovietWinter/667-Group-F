module UsersHelper
  def following?(id)
	Following.where(:user_id => current_user.id, :follow_id => id).present?
  end
end
