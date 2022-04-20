module RepositoriesHelper
  
  def self.get_all_repositories
    uri = URI.parse($GITHUB_BASE_URL +"repositories" )
    request = Net::HTTP::Get.new(uri)
    req_options = { use_ssl: uri.scheme == "https"}
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    json_response = JSON.parse(response.body)

    return [] if json_response.empty?
    json_response.map { |repo| Repository.jsonToModel(repo) }.to_a
  end
  
  def self.fetch_repositories(query, page )
    uri = URI.parse( $GITHUB_BASE_URL + "search/repositories?q=#{query}&page=#{page}" )

    request = Net::HTTP::Get.new(uri)
    req_options = { use_ssl: uri.scheme == "https"}
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    json_response = JSON.parse(response.body)
    return [] if json_response.empty?
    json_response[ "items" ].map { |repo| Repository.jsonToModel(repo) }.to_a
  end
end