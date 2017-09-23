module UsersHelper
  def user_post_comment_not_exist?
    current_user.posts.count == 0
  end
end
