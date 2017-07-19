class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :email
    	t.date :birthday
    	t.integer :gender
    	t.string :password_digest
    	t.string :user_name
      t.string :avatar
      t.string :provider
      t.string :uid
      t.integer :role, default: 0
      
      t.timestamps
    end
  end
end
