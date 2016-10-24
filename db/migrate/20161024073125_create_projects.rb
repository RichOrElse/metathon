class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.belongs_to :hackathon, foreign_key: true
      t.belongs_to :idea, foreign_key: true

      t.timestamps
    end

    add_index :projects, [:hackathon_id, :idea_id], unique: true
  end
end
