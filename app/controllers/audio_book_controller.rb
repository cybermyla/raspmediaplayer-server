class AudioBookController < ApplicationController

  def index
    @audiobooks = AudioBook.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @audiobooks }
    end
  end

  def detail
    @audiobook = AudioBook.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @audiobook }
    end
  end

  def download_pdf
    audiobook = AudioBook.find(params[:bookid])
    audiobookfilename = audiobook.audio_book_texts.find(params[:fileid]).path
    send_file "/home/pi/Music/AudioBooks/#{audiobook.name}/#{audiobookfilename}"
  end

  def download_audio
    audiobook = AudioBook.find(params[:bookid])
    audiobookfilename = audiobook.audio_book_audios.find(params[:fileid]).path
    send_file "/home/pi/Music/AudioBooks/#{audiobook.name}/#{audiobookfilename}"
  end

  def home
    respond_to do |format|
      format.html do
        redirect_to '/'
      end
    end
  end

  def reload
    @audiobooks = AudioBook.all
    @audiobooks.delete_all
    @bookspath = "/home/pi/Music/AudioBooks"
    Dir.chdir(@bookspath)
    books_list=Dir["*"].reject{|o| not File.directory?(o)}

    books_list.each do |book|
      audiobook = AudioBook.create(name: book)
      audiopaths = []
      textpaths = []
      files = Dir.foreach("#{@bookspath}/#{audiobook.name}") { |path|
        unless path.eql?(".") || path.eql?("..")
          if path.include? ".pdf"
            textpaths << path
          else
            audiopaths << path
          end
        end
      }

      textpaths.each do |path|
        audiobook.audio_book_texts.create(path: path)
      end

      audiopaths.sort_by! { |x| x.split('.')[0][/\d+/].to_i }
      audiopaths.each do |path|
        audiobook.audio_book_audios.create(path: path)
      end
    end

    respond_to do |format|
      format.html do
        redirect_to '/'
      end
    end
  end
end
