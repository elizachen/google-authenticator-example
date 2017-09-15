class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :salt
      t.string :google_secret

      t.timestamps
    end
  end
end
