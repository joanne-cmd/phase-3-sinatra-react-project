class CategoryController < ApplicationController
    get "/" do
        categories= Category.all #get all categories
        categories.to_json()
       end

    get "/category/:id" do
     category = Category.find_by(id: params[:id])
     category.to_json()
    end

    get "category/:id/item" do
        
    end

    post "/category/" do
        category= Category.create(
            name: params[:name]
        )
        category.save()
        {
            "message": "created succesfull",
            "status": "http 200"
        }.to_json()
    end

    patch "/category/update/:id" do
        category= Category.find_by(id: params[:id])
        category.update(
            name: params[:name]
        )
        category.to_json()
    end

    #delete function
    delete "/category/:id" do
        category= Category.find_by(id: params[:id])
        category.destroy
        {
            "message": "successful deleted",
            "status": "HTTP_status ok"

        }.to_json()
end


end