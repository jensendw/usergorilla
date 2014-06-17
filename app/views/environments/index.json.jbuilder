json.array!(@environments) do |environment|
  json.extract! environment, :id, :user_id, :environment
  json.url environment_url(environment, format: :json)
end
