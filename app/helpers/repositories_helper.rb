module RepositoriesHelper
  def self.fetch_repository(route, query, sort_by, order )
    uri = URI.parse($GITHUB_BASE_URL + "#{route}?q=#{query}&sortBy=#{sort_by}&order=#{order}"  )
    request = Net::HTTP::Get.new(uri)
    req_options = { use_ssl: uri.scheme == "https"}
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    response
  end
end