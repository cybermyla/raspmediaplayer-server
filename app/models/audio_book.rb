class AudioBook < ActiveRecord::Base
  has_many :audio_book_audios, :dependent => :destroy
  has_many :audio_book_texts, :dependent => :destroy 
end
