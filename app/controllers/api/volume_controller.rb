class Api::VolumeController < ApplicationController

  def down
    @response = "ok"
    
    system "scripts/decreasevolume.sh"
    if $?.exitstatus > 0
      @response = "spatne"
    end
    
    respond_to do |format|
      format.json { render json: @response }
      format.xml { render xml: @response }
    end

  end

  def up

    @response = "ok"

    system "scripts/increasevolume.sh"
    if $?.exitstatus > 0
      @response = "ko"
    end

    respond_to do |format|
      format.json { render json: @response }
      format.xml { render xml: @response }
    end

  end

end
