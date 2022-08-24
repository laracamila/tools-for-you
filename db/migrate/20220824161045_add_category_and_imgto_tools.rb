class AddCategoryAndImgtoTools < ActiveRecord::Migration[7.0]
  def change
    add_column :tools, :category, :string
    add_column :tools, :img_url, :string
  end
end
