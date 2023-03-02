class ItemController < ApplicationController
    get "/" do
        items= Item.all
        items.to_json()
    end
    #register an item
end