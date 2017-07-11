class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
    	t.string :name
    	t.string :author
    	t.string :publisher
    	t.string :description
    	t.integer :price
    	t.text :image
      t.timestamps
    end
  end
end
