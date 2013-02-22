# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  has_secure_password

  before_save { |user| user.email = email.downcase }


  #Validate name entered by user during signup.
  #name must be present and 50 chars or less.

  validates :name, :presence => true, :length => { :maximum => 50 }


  #Validate email address entered when user signs up.
  #Emails must be present, match the regex VALID_EMAIL_REGEX
  #and must also be unique.

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, :presence => true, :format => { :with => VALID_EMAIL_REGEX }, :uniqueness => { :case_sensitive => false }


  validates :password, :presence => true, :length => { :minimum => 6 }

  validates :password_confirmation, :presence => true

  
end
