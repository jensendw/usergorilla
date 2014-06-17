module SshkeysHelper
  def IdToUsername(id)
    Sshkey.find(id).user.username
  end

  def ldap_owner_sshkeys(username)
    @userarray = Array.new
    @Users = User.where("ldapowner LIKE ?", "%#{username}%")
    @Users.each do |user|
      @userarray.push user.id
    end
    @userarray
  end
end
