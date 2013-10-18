require 'rails/generators'
require 'rails/generators/named_base'

module FeatureFlag
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      desc "generates a migration for feature toggles"
      source_root File.expand_path('../../templates', __FILE__)

      def copy_migrations
        copy_migration "create_feature_flag_toggles.rb"
      end

      def self.next_migration_number(dirname)
        Time.now.strftime("%Y%m%d%H%M%S")
      end

      protected
      def copy_migration(migration_name)
        if self.class.migration_exists?("db/migrate", migration_name)
          say_status("skipped", "Migration #{migration_name} already exists")
        else
          migration_template "migrations/#{migration_name}", "db/migrate/#{migration_name}"
        end
      end
    end
  end
end
