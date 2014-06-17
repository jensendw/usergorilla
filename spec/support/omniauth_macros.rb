module OmniauthMacros
  def mock_auth_hash
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    OmniAuth.config.mock_auth[:ldap] = {
        'provider' => 'ldap',
        'uid' => '123545',
        'info' => {
            'nickname' => 'mockuser',
        },
        'credentials' => {
            'token' => 'mock_token',
            'secret' => 'mock_secret'
        }

    }
  end
end