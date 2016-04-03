class Api::VideoController < ApplicationController
  def play
    video_file = VideoFile.find(params[:id])
    response = video_file.id
    if video_file.nil?
      response = "file does not exist"
    else
      system "scripts/play_video.sh #{video_file.video_path.shellescape}"
      response = video_file.video_path.shellescape
      if $?.exitstatus > 0
        response = "another problem"
      end
      respond_to do |format|
        format.json { render json: response }
        format.xml { render xml: response }
      end
    end
  end

  def stop
    response = 'OK'
    system "scripts/stop_video.sh"
    if $?.exitstatus > 0
      response = "KO"
    end
    respond_to do |format|
      format.json { render json: response }
      format.xml { render xml: response }
    end
  end

  def pause
    response = 'OK'
    system "scripts/pause_video.sh"
    if $?.exitstatus > 0
      response = "KO"
    end
    respond_to do |format|
      format.json { render json: response }
      format.xml { render xml: response }
    end
  end
end
