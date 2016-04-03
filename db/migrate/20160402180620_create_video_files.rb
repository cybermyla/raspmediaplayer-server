class CreateVideoFiles < ActiveRecord::Migration
  def change
    create_table :video_files do |t|
      t.string :title
      t.string :subtitle_path
      t.string :video_path

      t.timestamps
    end
  end
end
