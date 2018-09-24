class GithubLoginService
  include Rails.application.routes.url_helpers

  def auth_url(post: nil)
    params = {
      client_id: '58d92f801e2ddfc2f7f8',
      redirect_uri: access_token_accounts_github_url
    }

    res = faraday_conn.get('/login/oauth/authorize', params)
    res.body.split('"').second
  end

  def login(code)
    params = {
      code: code,
      client_id: '58d92f801e2ddfc2f7f8',
      client_secret: '419ecaee73d2d0c558f40c6780398923b0646257'
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
