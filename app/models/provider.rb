class Provider < ApplicationRecord  
    include BCrypt 
    has_one_attached :avatar
    has_secure_password
    has_many :virtual_charts 
    has_many :patients, through: :virtual_charts 
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true 
    
end
