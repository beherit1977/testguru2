class GitHubClient
  ROOT_END_POINT = 'https://api.github.com'.freeze
  ACCESS_TOKEN = ENV['GIST_ACCESS_TOKEN']

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('/gists', params) do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  def delete_gist(gist_id)
    @http_client.delete("/gists/#{gist_id}") do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end


  private

  def setup_http_client
    Faraday.new(url: ROOT_END_POINT)
  end

end