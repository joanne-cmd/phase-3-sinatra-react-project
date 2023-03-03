class UserController < ApplicationController
    get "/users" do
        users= User.all
        users.to_json()
    end

    post "/users/" do
        existing_user= user.find_by(email: params[:email])
        if existing_user
            return{"error":"user is present"}.to_json()
            
        else
            fullname = params[:fullname]
            email= params[:email]
            phonenumber= params[:phonenumber]
    
            user = User.create(fullname: fullname, email: email, phonenumber: phonenumber)
            user.save
            if(fullname.present? && email.present? && phonenumber.present?)
                if user
                    message = {:successful => "user created successfull"}
                    message.to_json
                else
                    message = {:error => "user not created !!"}
                    message.to_json
                end  
            else
                message = {:error => "All fields should be filled !!"}
                    message.to_json
            end 
        end
    end
end