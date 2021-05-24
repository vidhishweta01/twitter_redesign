module UserHelper
  # rubocop:disable Metrics/PerceivedComplexity
  # rubocop:disable Metrics/CyclomaticComplexity
  def follow(user) 
    if signed_in? && !current_user.already_followed?(current_user.id, user.id) && currdist_user != user
      link_to 'Follow', followings_create_path(ids: { id1: current_user.id, id2: user.id })
    elsif signed_in? && current_user.already_followed?(current_user.id, user.id) && current_user != user
      link_to 'Unfollow', followings_destroy_path(following_id: Following.find_following(current_user.id, user.id))
    end
  end
end
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/CyclomaticComplexity
