Rails.application.config.middleware.use OmniAuth::Builder do

  provider :ldap,
           :title => 'User Manager',
           :host => 'ldap-us.wvrgroup.internal',
           :port => '636',
           :method => :ssl,
           :base => 'DC=wvrgroup,DC=internal',
           :uid => 'sAMAccountName',
           :name_proc => Proc.new {|name| name.gsub(/@.*$/,'')},
           :bind_dn => 'prd-sgor-svc',
           :password => 'MM2a7s0kIhO3Vb'
end