class Repository
   attr_accessor :id, :full_name, :description, :stargazers_count,
                 :watchers_count, :forks_count, :created_at, :updated_at,
                 :html_url, :avatar_url

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
end

