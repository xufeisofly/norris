class AuthenticationService
  def self.generate_token(user)
    raise 'User is not persisted' unless user.persisted?

    payload = { id: user.id }
    JwtToken.encode(payload, 2.weeks.from_now.to_i)
  end

  def self.authenticate(request)
    token = request.cookies['authentication_token']
    return nil if token.blank?

    payload = JwtToken.decode(token)
    payload && payload['id'] && User.find_by(id: payload['id'])
  end
end
