class RepositoriesController < ApplicationController
  def index
    service = GithubService.new(session)
    @repos_array = service.get_repos
  end

  def create
    service = GithubService.new(session)
    service.create_repo(params[:name])
    redirect_to '/'
  end
end
