class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :permalink
      t.text :header_content

      t.integer :position
      t.boolean :published

      t.string :icon_uid
      t.string :icon_name

      t.string :background_uid
      t.string :background_name

      t.timestamps
    end
    add_index :pages, :permalink
    add_index :pages, :position
  end
end
