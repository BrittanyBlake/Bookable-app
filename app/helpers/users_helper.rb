module UsersHelper
  def check_avatar(user)
    if @user.image_url.nil?
      image_tag('default.jpeg', alt: user.username, class: 'avatar')
    else
      image_tag(@user.image.url, alt: user.username, class: 'avatar')
    end
  end
end
