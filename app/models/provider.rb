class Provider < ApplicationRecord 
     has_many :virtual_charts 
    has_many :patients, through: :virtual_charts
end
