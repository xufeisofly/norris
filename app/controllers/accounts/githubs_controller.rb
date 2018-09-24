require 'login_service'

class Accounts::GithubsController < ApplicationController
  def authorization
    auth_url = GithubLoginService.new.auth_url
    redirect_to auth_url
  end

  def login
    user_data = GithubLoginService.new.login(params[:code])

    user = User.create_with(
      avatar_url: user_data['avatar_url'],
      html_url: user_data['html_url'],
      name: user_data['name']
    ).find_or_create_by!(github_user_id: user_data['id'])

    cookies[:authentication_token] = {
      value: AuthenticationService.generate_token(user),
      expires: 1.day.from_now
    }

    redirect_to root_url
  end
end
