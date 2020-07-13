class Api::V1::Patient < ApplicationRecord 
     has_many :virtual_charts 
    has_many :providers, through: :virtual_charts
end
