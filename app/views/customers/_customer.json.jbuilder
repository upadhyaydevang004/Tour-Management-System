json.extract! customer, :id, :email, :password, :name, :created_at, :updated_at
json.url customer_url(customer, format: :json)
