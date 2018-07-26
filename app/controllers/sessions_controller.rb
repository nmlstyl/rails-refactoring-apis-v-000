class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    service = GithubService.new
    response = service.authenticate!(ENV["GITHUB_CLIENT"], ENV["GITHUB_SECRET"], params[:code])
    session[:access_token] = response

    session[:username] = service.get_username

    redirect_to '/'
  end
end
