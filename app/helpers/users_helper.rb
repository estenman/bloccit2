module UsersHelper
  def user_post_comment_exist?
    current_user.comment.count >=1 || current_user.post.count >=1
  end
end
