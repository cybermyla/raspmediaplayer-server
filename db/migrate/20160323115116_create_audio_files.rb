class CreateAudioFiles < ActiveRecord::Migration
  def change
    create_table :audio_files do |t|
      t.string :artist
      t.string :title
      t.string :album
      t.string :tracknum
      t.string :path
      t.string :type

      t.timestamps
    end
  end
end
