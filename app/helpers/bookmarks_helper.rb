module BookmarksHelper
  def bookmarked?(post_id)
	Bookmarking.where(:user_id => current_user.id, :post_id => post_id).present?
  end
end
