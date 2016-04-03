class CreateAudioBooks < ActiveRecord::Migration
  def change
    create_table :audio_books do |t|
      t.string :name

      t.timestamps
    end

    create_table :audio_book_texts do |t|
      t.string :path
      t.belongs_to :audio_book
      t.timestamps
    end

    create_table :audio_book_audios do |t|
      t.string :path
      t.belongs_to :audio_book
      t.timestamps
    end
  end
end
