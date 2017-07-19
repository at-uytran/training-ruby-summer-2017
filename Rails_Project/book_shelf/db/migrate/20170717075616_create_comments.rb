class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
    	t.belongs_to :user
    	t.text :content
    	t.string :image
    	# t.string :user_id
    	t.integer :rating
      t.timestamps
    end
  end
end
