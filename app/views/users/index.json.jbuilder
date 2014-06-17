json.array!(@users) do |user|
  json.extract! user, :id, :username, :ingroups, :shell, :password, :realname, :ensure, :ldapowner
  json.url user_url(user, format: :json)
end
