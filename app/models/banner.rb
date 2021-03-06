# encoding: UTF-8
#
# == Schema Information
#
# Table name: banners
#
#  id      :integer(4)      not null, primary key
#  title   :string(255)
#  content :text
#

class Banner < ActiveRecord::Base
  validates :content, :presence => { :message => "La bannière ne peut être vide !" }

  def self.random
    nb = $redis.llen("banners")
    return nil if nb == 0
    id = $redis.lindex("banners", rand(nb))
    Banner.find(id).content
  end

  after_create :index_banners
  after_destroy :index_banners
  def index_banners
    $redis.del("banners")
    Banner.all.each do |b|
      $redis.rpush("banners", b.id)
    end
  end

  def content
    read_attribute(:content).to_s.html_safe
  end
end
