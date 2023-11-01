#!/bin/bash

# Delete old dummy app
rm -rf spec/dummy

# Generate new dummy app
DISABLE_MIGRATE=true bundle exec rake dummy:app

if [ ! -d "spec/dummy/config" ]; then exit 1; fi

# Cleanup
rm spec/dummy/.ruby-version
rm spec/dummy/Gemfile

cd spec/dummy

# Remove sprockets ralated stuff
sed -i "s|config.assets|# config.assets|g" config/environments/development.rb
sed -i "s|config.assets|# config.assets|g" config/environments/test.rb
sed -i "s|config.assets|# config.assets|g" config/environments/production.rb
rm config/initializers/assets.rb

# Remove active record related stuff
sed -i 's|require "action_mailbox/engine"|# require "action_mailbox/engine"|' config/application.rb
sed -i 's|require "active_storage/engine"|# require "active_storage/engine"|' config/application.rb
sed -i 's|require "action_text/engine"|# require "action_text/engine"|' config/application.rb
sed -i 's|require "active_record/railtie"|# require "active_record/railtie"|' config/application.rb
sed -i "s|config.active_record|# config.active_record|g" config/environments/development.rb
sed -i "s|config.active_record|# config.active_record|g" config/environments/test.rb
sed -i "s|config.active_record|# config.active_record|g" config/environments/production.rb
sed -i "s|config.active_storage|# config.active_storage|g" config/environments/development.rb
sed -i "s|config.active_storage|# config.active_storage|g" config/environments/test.rb
sed -i "s|config.active_storage|# config.active_storage|g" config/environments/production.rb

# Use correct Gemfile
# sed -i "s|../Gemfile|../../../Gemfile|g" config/boot.rb

# Setup i18n
touch config/initializers/i18n.rb
echo "Rails.application.config.i18n.available_locales = [:en, :de]" >> config/initializers/i18n.rb
echo "Rails.application.config.i18n.default_locale    = :de" >> config/initializers/i18n.rb

# Setup lexoffice_client
rails generate lexoffice_client:rails:install
