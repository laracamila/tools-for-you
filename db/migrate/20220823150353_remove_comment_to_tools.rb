class RemoveCommentToTools < ActiveRecord::Migration[7.0]
  def change
    remove_column :tools, :comment
  end
end
