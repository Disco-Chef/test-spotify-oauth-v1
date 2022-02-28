class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @me = RSpotify::User.find(User.first.uid)
  end
end
