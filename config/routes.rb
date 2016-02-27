Rails.application.routes.draw do

  root 'message#new'
  post '/message' => 'message#send_msg'

end
