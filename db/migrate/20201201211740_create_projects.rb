class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.date :deadline
      t.string :location
      t.belongs_to :creator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
