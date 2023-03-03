class ItemController < ApplicationController
    get "/" do
        items= Item.all
        items.to_json()
    end
    #register an item
        get "/find_item" do
            items= Item.all
            items.to_json(include: {Item:{only: [:name] }})
        end

    patch "/item/update/:id" do
        items= Item.find_by(id: params[:id])
        items.update(
            name: params[:name],
            image_url: params[:image_url],
            description: params[:description]
        )
        items.to_json()
    end
    post "/fetch_items/" do
        items= Item.create(
            name: params[:name],
            image_url: params[:image_url],
            description: params[:description]

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
            "message": "succesfull deleted  item"
            "statu":"HTTP_status_ok"
        }.to_json()
    end


end