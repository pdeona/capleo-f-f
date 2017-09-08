module UsersHelper
  def gravatar_for user, size: 80
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag gravatar_url, alt: user.name, class: 'user profile-pic gravatar'
  end

  def sign_in
    user = params[:user]
    @user = User.find_by(user.email)
    if @user
      if user.password_digest == @user.password_digest
        @user
      else
        "Invalid password"
      end
    end
  end

end
