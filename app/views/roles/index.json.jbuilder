json.array!(@roles) do |role|
  json.extract! role, :id, :user_id, :role
  json.url role_url(role, format: :json)
end
