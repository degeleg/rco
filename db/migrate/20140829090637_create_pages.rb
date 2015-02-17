class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :permalink
      t.text :header_content

      t.integer :position
      t.boolean :published
      t.string :drop_text

      t.string :icon

      t.string :background

      t.timestamps
    end
    add_index :pages, :permalink
    add_index :pages, :position
  end
end
