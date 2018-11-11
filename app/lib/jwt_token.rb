# frozen_string_literal: true

module JwtToken
  def self.encode(payload, expire_at = nil)
    payload[:exp] = expire_at if expire_at
    JWT.encode(payload, ENV['JWT_SECRET'], 'HS256')
  end

  def self.decode(token)
    payload, _header = JWT.decode(token, ENV['JWT_SECRET'], 'HS256')
    payload
  end
end
