class GithubLoginService
  include Rails.application.routes.url_helpers

  def auth_url
    params = {
      client_id: '58d92f801e2ddfc2f7f8'
    }

    res = faraday_conn.get('/login/oauth/authorize', params)
    res.body.split('"').second
  end

  def access_token(code)
    params = {
      code: code,
      client_id: '58d92f801e2ddfc2f7f8',
      client_secret: '419ecaee73d2d0c558f40c6780398923b0646257'
    }

    res = faraday_conn.post('login/oauth/access_token', params)
    binding.pry
  end

  private

  def faraday_conn
    Faraday.new(url: 'https://github.com')
  end
end
