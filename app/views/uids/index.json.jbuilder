json.array!(@uids) do |uid|
  json.extract! uid, :id, :user_id, :uid
  json.url uid_url(uid, format: :json)
end
