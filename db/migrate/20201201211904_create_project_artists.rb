class CreateProjectArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :project_artists do |t|
      t.belongs_to :project, null: false, foreign_key: true
      t.belongs_to :artist, null: false, foreign_key: true
      t.string :accepted, :default => 'pending'

      t.timestamps
    end
  end
end
