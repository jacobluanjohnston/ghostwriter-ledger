class CreateCommits < ActiveRecord::Migration[7.1]
  def change
    create_table :commits do |t|
      t.string :sha
      t.string :author
      t.string :repo
      t.text :message
      t.float :ai_score
      t.text :tags

      t.timestamps
    end
  end
end
