class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def spotify
    # raise
    user = User.find_for_oauth(request.env['omniauth.auth'])
    # spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    # binding.pry
    if user.persisted?
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Spotify') if is_navigational_format?
    else
      session['devise.spotify_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def failure
    # binding.pry
  end
end
