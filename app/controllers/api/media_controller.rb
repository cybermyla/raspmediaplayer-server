require 'mp3info'
class Api::MediaController < ApplicationController

  def get_all_audio_files
    response = AudioFile.all
    respond_to do |format|
      format.json { render json: response }
      format.xml { render xml: response }
    end
  end

  def get_all_albums
    response = AudioFile.all
    respond_to do |format|
      format.json { render json: response }
      format.xml { render xml: response }
    end
  end

  def get_all_artists
    response = AudioFile.all
    respond_to do |format|
      format.json { render json: response }
      format.xml { render xml: response }
    end
  end

  def get_all_video_files
    response = VideoFile.all
    respond_to do |format|
      format.json { render json: response }
      format.xml { render xml: response }
    end
  end

  def get_radio_stations

    #RadioStation.delete_all

    #station1 = RadioStation.create(name: "Evropa 2", address:"http://icecast3.play.cz/evropa2-128.mp3.m3u")
    #station2 = RadioStation.create(name: "Radio City", address:"http://kocka.limemedia.cz:8000/cityfm128.mp3.m3u")
    #station3 = RadioStation.create(name: "Radio 1", address:"http://www.play.cz/radio/radio1-192.mp3.m3u")

    @response = RadioStation.all

    respond_to do |format|
      format.json { render json: @response }
      format.xml { render xml: @response }
    end
  end

end
