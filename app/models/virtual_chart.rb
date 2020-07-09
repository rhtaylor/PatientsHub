class VirtualChart < ApplicationRecord
  belongs_to :provider
  belongs_to :patient 
  
  def self.full_record_dataset 
    self.all.map{|record| [record, record.patient, record.provider] }
  end

  def patient 
     Patient.find(self.patient_id)
  end 
  def provider 
    Provider.find(self.provider_id)
  end 
  
  def detail_record 
   {:record => self, :provider => Provider.find(self.provider_id), :patient => Patient.find(self.patient_id)}
  end
end 
