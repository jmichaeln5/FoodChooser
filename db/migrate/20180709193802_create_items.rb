class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
