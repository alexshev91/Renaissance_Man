class User < ActiveRecord::Base
  has_secure_password

  validates :password,
  presence: true,
  confirmation: true,
  length: {minimum: 6},
  on: :create


  def self.authenticate name, password
    User.find_by_name(name).try(:authenticate, password)
  end

  def score
  	(self.technology + self.science + self.medicine + self.art)
  end

end
