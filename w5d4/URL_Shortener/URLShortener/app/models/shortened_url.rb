# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true

  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User

  def self.random_code
    random = SecureRandom.urlsafe_base64(16)
    until !ShortenedUrl.exists?(random)
      random = SecureRandom.urlsafe_base64(16)
    end
    random
  end

  def self.shortened_url_creator(user, long_url)
    ShortenedUrl.create!(long_url: long_url, short_url: self.random_code, user_id: user.id)
  end
end