class User < ActiveRecord::Base
  has_secure_password
  after_initialize :default_values 

  validates :email, presence: true
  validates :password, presence: true
  validates :username, presence: true
  
  private

  def default_values
    self.admin ||= false
  end
end
