class RepositoriesController < ApplicationController
  def index
    service = GithubService.new(session)
    @repos_array = service.get_repos
    # response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    # @repos_array = JSON.parse(response.body)
  end

  def create
    service = GithubService.new(session)
    service.create_repo(params[:name])
    redirect_to '/'
  end
end
