class Api::RadioController < ApplicationController
  def play
    radioStation = RadioStation.find(params[:id])

    system "scripts/stop_radio.sh"
    system "scripts/play_radio.sh #{radioStation.address}"

    @response = '200'

    respond_to do |format|
      format.json { render json: @response }
      format.xml { render xml: @response }
    end

  end

  def stop
    system "scripts/stop_radio.sh"

    @response = '200'
    respond_to do |format|
      format.json { render json: @response }
      format.xml { render xml: @response }
    end
  end
end
