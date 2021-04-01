class User < ApplicationRecord
  validates :username, :email, :session_token, presence: true, uniqueness: true
  # validates :age, :political_affiliation, presence: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  private
  attr_reader :password

  public

  after_initialize :ensure_session_token # method is run after initialization 



  def self.find_by_credentials(username, password)
    user = User.find_by(username: username) # find user by unique username, returns user object
    if user && user.password?(password)
      user
    else
      nil
    end
  end

  def password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password) 
    # create BCrypt Object using digest
    # call is_password? (BCrypt method) on the object while passing in the password string
    # returns true if it matches and false if not
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password) # creates password_digest string
    # p "password setter"
    @password = password
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64 # creates random string
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64 # new string
    self.save! # save (with loud errors)
    self.session_token # return token
  end
end
