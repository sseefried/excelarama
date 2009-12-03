# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_excelarama_session',
  :secret      => '0a4dac304cd1bcd66d4634683560ecfd10356829d75a5bcbd52d0841964dfe8ace2bd4a1828ddd65d7d3c4b812e4796f03ca07dba3c5ecc3babbe7c226f48fc9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
