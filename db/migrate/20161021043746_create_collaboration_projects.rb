class CreateCollaborationProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :collaboration_projects do |t|
      t.belongs_to :hackathon, foreign_key: true, null: false
      t.belongs_to :idea, foreign_key: true, null: false

      t.timestamps
    end
  end
end
