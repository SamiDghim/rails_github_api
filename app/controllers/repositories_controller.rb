class RepositoriesController < ApplicationController
  include RepositoriesHelper

  def search
    @repositories = []
    @query = "d"
    @sort_by = ""
    @order = ""
    @route = if @query.nil?
      "repositories/" 
    else
      "search/repositories"
    end

    response = RepositoriesHelper.fetch_repository( @route, @query, @sort_by, @order )

    json_response = JSON.parse(response.body)
    @total_count = response.body["total_count"]

    @repositories = json_response[ "items" ].map{|repo| Repository.new(
      id: repo["id"],
      full_name: repo["full_name"],
      description: repo["description"],
      stargazers_count: repo["stargazers_count"],
      watchers_count: repo["watchers_count"],
      forks_count: repo["forks_count"],
      html_url: repo["html_url"],
      avatar_url: repo["owner"]["avatar_url"]
    )}
  end
end
