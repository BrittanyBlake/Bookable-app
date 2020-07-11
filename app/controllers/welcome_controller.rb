class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    redirect_to users_show_path if current_user
  end
end
