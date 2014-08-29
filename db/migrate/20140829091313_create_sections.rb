class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|

      t.string :section_title

      t.integer :page_id

      t.text :content
      
      t.string :image_uid
      t.string :image_name

      t.string :background_uid
      t.string :background_name

      t.timestamps
    end
  end
end
