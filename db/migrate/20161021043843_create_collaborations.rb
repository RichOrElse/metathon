class CreateCollaborations < ActiveRecord::Migration[5.0]
  def change
    create_table :collaborations do |t|
      t.belongs_to :idea, foreign_key: true, null: false
      t.belongs_to :hacker, foreign_key: true, null: false
      t.integer :project_id, foreign_key: true

      t.timestamps
    end
  end
end
