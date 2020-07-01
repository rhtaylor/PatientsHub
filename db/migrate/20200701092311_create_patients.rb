class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.integer :phone_number
      t.string :diagnosis
      t.integer :age

      t.timestamps
    end
  end
end
