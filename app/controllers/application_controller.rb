class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    items= Item.all
    items.to_json()
end

post "/create" do
  items = Item.create(
      name: params[:name],
      image_url: params[:image_url],
      description: params[:description],
      category: params[:category]

  )
  items.save()
  {
      "message": "created succesfull",
      "status": "http 200"
  }.to_json()
end

# delete "/item" do
#   items= Item.all
#   items.destroy
#   {
#       "message": "succesfull deleted  item",
#       "status": "HTTP_status_ok"
#   }.to_json()
# end
delete "/items" do
  Item.destroy_all
  {
    message: "All items have been deleted"
  }.to_json
end

delete '/items/:id' do
  item = Item.find_by(id: params[:id])
  if item
    item.destroy
    { message: "Item with id #{params[:id]} has been deleted" }.to_json
  else
    status 404
    { message: "Item not found" }.to_json
  end
end

end
