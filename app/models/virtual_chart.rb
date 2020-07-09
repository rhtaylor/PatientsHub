class VirtualChart < ApplicationRecord
  belongs_to :provider
  belongs_to :patient 

  def patient 
     Patient.find(self.patient_id)
  end
end 
