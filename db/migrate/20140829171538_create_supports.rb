class CreateSupports < ActiveRecord::Migration
  def change
    create_table :supports do |t|

      t.string :ticket

      t.integer :admin_id

      t.timestamps
    end
  end
end
