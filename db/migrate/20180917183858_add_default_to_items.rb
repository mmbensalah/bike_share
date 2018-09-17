class AddDefaultToItems < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :image, :string, default: 'trail_bike.jpg'
  end
end
