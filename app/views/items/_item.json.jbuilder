json.extract! item, :id, :itemname, :itemcall, :situ, :ani, :day, :category_id, :fav, :user_id, :created_at, :updated_at
json.url item_url(item, format: :json)