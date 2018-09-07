class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :title

#  Added from tutorial
      # t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
