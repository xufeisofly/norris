class Post < ApplicationRecord
  enum content_type: { md: 1, org: 2 }

  self.per_page = 10

  def reader_ips
    Redis.current.smembers "p:#{self.id}:rds"
  end

  def record_reader_ip(ip)
    Redis.current.sadd "p:#{self.id}:rds", ip
  end

  def readers_num
    reader_ips.size
  end
end
