class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.boolean :test 
      t.string :discover
      t.string :gender
      t.string :date_of_birth
      t.string :favorite_song
      t.string :bio

      t.timestamps null: false
    end
  end
end
