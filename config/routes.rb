Rails.application.routes.draw do

  get 'audio_book/index'
  get 'audiobook/detail/:id' => 'audio_book#detail'
  get 'audiobook/detail/downloadpdf/:bookid/:fileid' => 'audio_book#download_pdf'
  get 'audiobook/detail/downloadaudio/:bookid/:fileid' => 'audio_book#download_audio'
  post 'audio_book/reload'
  post 'audio_book/home'

  root 'audio_book#index'

  namespace :api, :defaults => { :format => 'json' } do
    get 'volume/up' => 'volume#up'
	  get 'volume/down' => 'volume#down'
    
	  get 'playback/play/:id' => 'playback#play'
	  get 'playback/stop' => 'playback#stop'
	  get 'playback/pause' => 'playback#pause'

    get 'file/createlistofaudiofiles' => 'file#create_list_of_audio_files'
    get 'file/getlastaudioupdatedate' => 'file#get_last_audio_update_date'
    get 'file/createlistofvideofiles' => 'file#create_list_of_video_files'

    get 'media/getallaudiofiles' => 'media#get_all_audio_files'
    get 'media/getallalbums' => 'media#get_all_albums'
    get 'media/getallartists' => 'media#get_all_artists'
    get 'media/getallvideofiles' => 'media#get_all_video_files'
    get 'media/getradiostations' => 'media#get_radio_stations'

    get 'video/play/:id' => 'video#play'
    get 'video/stop' => 'video#stop'
    get 'video/pause' => 'video#pause'

    get 'radio/play/:id' => 'radio#play'
    get 'radio/stop' => 'radio#stop'




  end
end
