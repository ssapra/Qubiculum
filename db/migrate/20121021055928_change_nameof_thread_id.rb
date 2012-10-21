class ChangeNameofThreadId < ActiveRecord::Migration
  def change
    rename_column :answers, :thread_id, :web_id
  end
end
