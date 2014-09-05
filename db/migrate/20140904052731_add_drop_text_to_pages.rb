class AddDropTextToPages < ActiveRecord::Migration
  def change
    add_column :pages, :drop_text, :string
  end
end
