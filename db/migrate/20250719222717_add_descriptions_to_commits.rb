class AddDescriptionsToCommits < ActiveRecord::Migration[7.1]
  def change
    add_column :commits, :similarity_description, :text
    add_column :commits, :concepts, :text
    add_column :commits, :concept_description, :text
  end
end
