class CreateHackathons < ActiveRecord::Migration[5.0]
  def change
    create_table :hackathons do |t|
      t.string :title, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps
    end
    add_index :hackathons, :title, unique: true
  end
end
