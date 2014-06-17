# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
UserManager::Application.config.secret_key_base = '310abca913f08902257da8eff2d7de511468d4ff7d455757c9d3890fd66768e1f4f2751553ad75d52e88de1428f1968dc77340fa39163ace44853e960bff693a'
