json.array!(@sshkeys) do |sshkey|
  json.extract! sshkey, :id, :user_id, :key
  json.url sshkey_url(sshkey, format: :json)
end
