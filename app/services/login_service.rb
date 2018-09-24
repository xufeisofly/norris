class GithubLoginService
  include Rails.application.routes.url_helpers

  def auth_url(post: nil)
    params = {
      client_id: ENV['GITHUB_CLIENT_ID'],
      redirect_uri: 'https://www.niltouch.cn/accounts/github/login'
    }

    res = faraday_conn.get('/login/oauth/authorize', params)
    res.body.split('"').second
  end

  def login(code)
    params = {
      code: code,
      client_id: ENV['GITHUB_CLIENT_ID'],
      client_secret: ENV['GITHUB_CLIENT_SECRET_KEY']
    }
    res = faraday_conn.post('login/oauth/access_token', params)
    user_data = faraday_api_conn.get('user?' + res.body).body
    JSON.parse(user_data)
  end

  private

  def faraday_conn
    Faraday.new(url: 'https://github.com')
  end

  def faraday_api_conn
    Faraday.new(url: 'https://api.github.com')
  end
end
