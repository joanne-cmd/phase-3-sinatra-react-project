class ItemController < ApplicationController
    get "/" do
        items= Item.all
        items.to_json()
    end
    #register an item
get "/find_item" do
    items= Item.all
    items.to_json(include: {category:{only: [:name] }})
end


end