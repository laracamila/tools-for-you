class ChangeImageToLocationInTools < ActiveRecord::Migration[7.0]
  def change
    rename_column :tools, :img_url, :location
  end
end
