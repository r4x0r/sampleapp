class User < ActiveRecord::Base

	before_save { self.email = email.downcase }

	validates :name,  presence: true, length: { maximum: 50 }
 	
 	#this is email regular expression
 	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	
 	#validation of the email field
  	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

 	#(Presence validations for the password and its confirmation are 
 	#automatically added by has_secure_password.)
    has_secure_password
    # Validate password has minimum 6 characters
    validates :password, length: { minimum: 6 }
end
