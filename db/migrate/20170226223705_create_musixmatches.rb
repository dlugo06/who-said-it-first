class CreateMusixmatches < ActiveRecord::Migration[5.0]
  def change
    create_table :musixmatches do |t|
      t.string :song_name
      t.string :album_name
      t.string :artist_name
      t.date :release_date

      t.timestamps
    end
  end
end
