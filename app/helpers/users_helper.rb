module UsersHelper
  def create_linux_password(username)
    password = `openssl passwd -noverify -1 #{username}`
  end
end
