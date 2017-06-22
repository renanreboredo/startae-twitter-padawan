class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :role
  validates_uniqueness_of :name

  def self.twitter_all
    self.where.not(twitter_account: nil).all
  end
end
