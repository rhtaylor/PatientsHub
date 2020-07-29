class Provider < ApplicationRecord  
    include BCrypt 
    
    has_secure_password
    has_many :virtual_charts 
    has_many :patients, through: :virtual_charts 
    
    
end
