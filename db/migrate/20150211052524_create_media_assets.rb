class CreateMediaAssets < ActiveRecord::Migration
  def change
    create_table :media_assets do |t|

      t.string :image
      t.string :name
      t.string :title

      t.timestamps null: false
    end
  end
end
