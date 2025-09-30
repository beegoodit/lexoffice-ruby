#!/bin/bash

# Delete old dummy app
rm -rf spec/dummy

# Generate new dummy app
CURRENT_DIR=$(pwd)
TEMP_DIR=$(mktemp -d)
cd $TEMP_DIR
rails --version
rails new dummy \
  --skip-git \
  --skip-bundle \
  -T \
  --javascript=importmap
mv dummy $CURRENT_DIR/spec/dummy
cd $CURRENT_DIR
rm -rf $TEMP_DIR

# Abort unless the dummy app was created successfully
if [ ! -d "spec/dummy" ]; then
  echo "Dummy app was not created successfully"
  exit 1
fi

# Proceed in the dummy app
cd spec/dummy

# Remove .ruby-version
rm .ruby-version

# In boot.rb use the Gemfile from the root directory
sed -i 's|../Gemfile|../../../Gemfile|' config/boot.rb

# Remove Gemfile*
rm Gemfile*

# install importmaps
# bin/rails importmap:install

# install turbo-rails
# bin/rails turbo:install

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
