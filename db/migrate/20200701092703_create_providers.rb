class CreateProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :job
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
