class User < ApplicationRecord
     # Use the bcrypt gem to encrypt passwords when user creates account, and store only the encrypted version in the 'users' table
    has_secure_password

    # Ensure user enters valid & unique email address
    validates :email, 
              presence: true, 
              uniqueness: {case_sensitive: false},
              length: {minimum: 4, maximum: 254},
              format: {with: /^(.+)@(.+)$/, message: "Please check the email address. It's invalid."}
end
