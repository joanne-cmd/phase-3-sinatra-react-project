class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
   categories= Category.all #get all categories
   categories.to_json()
  end
  


end
