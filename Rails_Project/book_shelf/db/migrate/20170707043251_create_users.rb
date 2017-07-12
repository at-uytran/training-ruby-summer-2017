class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :email
    	t.datetime :birthday
    	t.integer :gender
    	t.text :password
    	t.text :user_name
      t.text :image
      
      t.timestamps
    end
  end
end
