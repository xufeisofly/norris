# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :tags

  enum content_type: { md: 1, org: 2 }

  self.per_page = 10

  class << self
    def total_readers_num
      # all.reduce(0) { |result, post| result + post.readers_num }
      5000
    end
  end

  def reader_ips
    Redis.current.smembers "p:#{id}:rds"
  end

  def record_reader_ip(ip)
    Redis.current.sadd "p:#{id}:rds", ip
  end

  def readers_num
    reader_ips.size
  end

  def tags_attributes=(tags_params)
    tags_params.each do |tag_params|
      tags << Tag.find_or_create_by(tag_params) if tag_params.present?
    end
  end
end
