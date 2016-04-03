require 'shellwords'

class Api::PlaybackController < ApplicationController

  def play

    audio_file = AudioFile.find(params[:id])
    response = "200 OK"
    if audio_file.nil?
      response = "404 KO"
    else
      system "scripts/play_song.sh #{audio_file.path.shellescape}"
      if $?.exitstatus > 0
        response = "404 KO"
      end

      respond_to do |format|
        format.json { render json: response }
        format.xml { render xml: response }
      end
    end
  end

  def stop

    @response = "200 OK"

    system "scripts/stop_song.sh"
    if $?.exitstatus > 0
      @response = "404 KO"
    end

    respond_to do |format|
      format.json { render json: @response }
      format.xml { render xml: @response }
    end

  end

  def pause

    @response = "200 OK"

    system "scripts/pause_song.sh"
    if $?.exitstatus > 0
      @response = "404 KO"
    end

    respond_to do |format|
      format.json { render json: @response }
      format.xml { render xml: @response }
    end

  end

end
