class Post < ApplicationRecord
  has_many :post_tag_relations
  has_many :tags, through: :post_tag_relations

  accepts_nested_attributes_for :tags

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

  def tags_attributes=(tags_params)
    tags_params.each do |tag_params|
      self.tags << Tag.find_or_create_by(tag_params) unless tag_params.blank?
    end
  end
end
