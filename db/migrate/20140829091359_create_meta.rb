class CreateMeta < ActiveRecord::Migration
  def change
    create_table :meta do |t|
    	t.integer 	:page_id
		t.string 	:descriptive_title
		t.string 	:author
		t.string 	:keywords
		t.text		:description
      t.timestamps
    end
  end
end
