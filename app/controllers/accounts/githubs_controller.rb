class Accounts::GithubsController < ApplicationController
  def authorization
    auth_url = GithubLoginService.new.auth_url
    redirect_to auth_url
  end

  def access_token
    binding.pry
    access_token = GithubLoginService.new.access_token(params[:code])
    user_data = GithubLoginService.new.user_data(access_token)
  end
end
