class RemoveCompleteFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :complete, :boolean
  end
end
