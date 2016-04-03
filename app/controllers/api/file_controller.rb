class Api::FileController < ApplicationController
  def get_last_audio_update_date
    first = AudioFile.first
    response = DateTime.new(1980, 7, 3)
    unless first.nil?
      response = first.created_at
    end

    respond_to do |format|
      format.json { render json: response }
      format.xml { render xml: response }
    end
  end

  def create_list_of_audio_files
    AudioFile.delete_all

    filesPath = "/home/pi/Music"
    response = "DONE"

    files = Dir.glob("#{filesPath}/**/*.mp3")

    files.each do |file|
      Mp3Info.open(file) do |mp3|
        artist = mp3.tag.artist
        title = mp3.tag.title
        album = mp3.tag.album
        tracknum = mp3.tag.tracknum
        path = "#{File.dirname(file)}/#{File.basename(file)}"
        type = File.extname(file)

        if album.nil? || title.nil? || tracknum.nil?
          splitted_path = path.split('/')
          if album.nil?
            album = splitted_path[splitted_path.count - 2]
          end
          if title.nil?
            title = File.basename(file, ".*")[1..-1]
          end
        end
        audio_file = AudioFile.create(artist: artist, title: title, album: album, tracknum: tracknum, path: path)
        audio_file.save
      end
    end

    respond_to do |format|
      format.json { render json: response }
      format.xml { render xml: response }
    end
  end

  def create_list_of_video_files
    VideoFile.delete_all
    files_path = "/home/pi/Videos"

    files = Dir.glob("#{files_path}/**/*").grep(/.*.(avi$|mkv$)/)
    files.each do |file|
      title = remove_file_extension(File.basename(file))
      video_path = "#{File.dirname(file)}/#{File.basename(file)}"

      video_file = VideoFile.create(title: title, video_path: video_path, subtitle_path: nil)
      video_file.save
    end

    respond_to do |format|
      format.json { render json: VideoFile.all.count }
      format.xml { render xml: VideoFile.all.count }
    end
  end

  def remove_file_extension (file_name)
    splitted = file_name.split(".")
    splitted.delete(splitted[splitted.length - 1])
    return splitted.join('.')
  end

end
