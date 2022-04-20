class RepositoriesController < ApplicationController
  include RepositoriesHelper
  def search
    @repositories = []
    @query = ""

    @query = params[:query] if params[:query]
    @repositories = if @query.present?
      RepositoriesHelper.fetch_repositories( params[:query], params[:page].to_i)
    else
      RepositoriesHelper.get_all_repositories
    end

    @paginatable_array = Kaminari.paginate_array(@repositories).page(params[:page]).per(30)
  end
end
