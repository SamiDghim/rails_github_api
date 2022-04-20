class Repository
   attr_accessor :id, :full_name, :description, :stargazers_count,
                 :watchers_count, :forks_count, :created_at, :updated_at,
                 :html_url, :avatar_url, :topics

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end


  def self.jsonToModel( response )
    Repository.new(
      id:               response["id"],
      full_name:        response["full_name"],
      description:      response["description"],
      stargazers_count: response["stargazers_count"] || 0,
      watchers_count:   response["watchers_count"] || 0,
      forks_count:      response["forks_count"] || 0,
      html_url:         response["html_url"],
      avatar_url:       response["owner"]["avatar_url"],
      topics:           response["topics"] || []
    )
  end
end

