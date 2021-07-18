module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(tweet)
    like = Like.find_by(tweet: tweet, user: current_user)
    if like
      link_to('Dislike', tweet_like_path(id: like.id, tweet_id: tweet.id), method: :delete)
    else
      link_to('Like', tweet_likes_path(tweet_id: tweet.id), method: :post)
    end
  end
end
