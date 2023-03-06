class Item <  ActiveRecord::Base
   belongs_to :user
   enum category: [:cleaning, :Drinks, :Meats, :Meals, :Dairy, :Fruits, :Vegetables, :Hygiene, :Groceries, :Bakery, :Health, :Beauty]
end