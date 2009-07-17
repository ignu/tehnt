# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tehnt_session',
  :secret      => 'd71951c2ba3108bded2d1ab45f89c0d2632c89b02e87b72ed83a17acae677d2ec55aee3ca11c44ee2e0bffc5cf53b971953e35d78578835513c60416de0e0311'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
