class ChangePhoneNumberToString < ActiveRecord::Migration[6.0]
  def change 
     change_column :patients, :phone_number, :string
  end
end
