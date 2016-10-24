class CreateCollaborations < ActiveRecord::Migration[5.0]
  def change
    create_table :collaborations do |t|
      t.belongs_to :idea, foreign_key: true, null: false
      t.belongs_to :hacker, foreign_key: true, null: false
      t.belongs_to :project, foreign_key: true

      t.timestamps
    end

    add_index :collaborations, [:project_id, :idea_id, :hacker_id], unique: true
  end
end
