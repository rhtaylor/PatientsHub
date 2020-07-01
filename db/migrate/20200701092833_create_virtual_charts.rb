class CreateVirtualCharts < ActiveRecord::Migration[6.0]
  def change
    create_table :virtual_charts do |t|
      t.datetime :date
      t.text :note
      t.references :provider, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
