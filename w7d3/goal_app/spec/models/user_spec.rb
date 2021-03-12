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
require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:toby) { User.create(username: "toby", password_digest: "BCrypt::Password.create123456" , session_token: "t343qg3")}

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_uniqueness_of(:username) }
end
