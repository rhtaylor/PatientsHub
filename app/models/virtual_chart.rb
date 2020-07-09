class VirtualChart < ApplicationRecord
  belongs_to :provider
  belongs_to :patient 

  def patient 
     Patient.find(self.patient_id)
  end 
  def provider 
    Provider.find(self.provider_id)
  end
end 
