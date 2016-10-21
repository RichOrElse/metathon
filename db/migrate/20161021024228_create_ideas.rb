class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.belongs_to :category, foreign_key: true
      t.belongs_to :hacker, foreign_key: true
      t.integer :status, default: 0
      t.integer :progress, default: 0
      t.string :title
      t.string :description
      t.text :specialties

      t.timestamps
    end
  end
end
