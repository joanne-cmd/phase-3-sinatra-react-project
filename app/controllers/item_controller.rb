class ItemController < ApplicationController
    get "/" do
        items= Item.all
        items.to_json()
    end
    #register an item
    get "/item/:id" do
             items = Item.find_by(id: params[:id])
             items.to_json()
            end

    patch "/item/update/:id" do
        items= Item.find_by(id: params[:id])
        items.update(
            name: params[:name],
            image_url: params[:image_url],
            description: params[:description],
            category: params[:category]

        )
        items.to_json()
    end
    put '/items/:id' do
        # Fetch the user to update from the database or any other source
        item = Item.find(params[:id])
        
        # Update the user's attributes
        item.name = params[:name]
       
        
        # Save the updated user
        item.save
        
        # Redirect to the user's profile page
        redirect "/items/#{item.id}"
    end

    post "/create/" do
        items = Item.create(
            name: params[:name]
            # image_url: params[:image_url],
            # description: params[:description],
            # category: params[:category]

        )
        items.save()
        {
            "message": "created succesfull",
            "status": "http 200"
        }.to_json()
    end

    delete "/delete_item/:id" do
        items= Item.find_by(id: params[:id])
        items.destroy
        {
            "message": "succesfull deleted  item",
            "statu": "HTTP_status_ok"
        }.to_json()
    end


end