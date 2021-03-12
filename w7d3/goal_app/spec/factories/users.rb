# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#
FactoryBot.define do
  factory :user do
    
  end
end
