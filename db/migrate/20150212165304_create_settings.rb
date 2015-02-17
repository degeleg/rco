class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name
      t.string :street_address
      t.string :alternate_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :fax
      t.string :phone

      t.string :map_location

      t.timestamps null: false
    end
  end
end
