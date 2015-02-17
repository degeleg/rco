class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|

      t.string :section_title

      t.integer :page_id
      t.integer :position

      t.text :content

      t.string :background
      
      t.timestamps
    end
  end
end
