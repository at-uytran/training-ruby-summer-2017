# nodoc
class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.date :birthday
      t.integer :gender
      t.string :password_digest
      t.string :password_confirmation_digest
      t.string :user_name
      t.string :avatar
      t.string :provider
      t.string :uid = :email
      t.integer :role, default: 0
      t.string :activation_digest
      t.datetime :activation_sent_at
      t.boolean :activated, default: false
      t.datetime :activated_at
      t.string :reset_digest
      t.datetime :reset_sent_at
      t.timestamps
    end
  end
end
