module Settr
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      desc "install settr default files"

      def self.next_migration_number(path)
        @prev_migration_nr ||= Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        (@prev_migration_nr).to_s
      end

      def copy_migrations
        migration_template "db/migrate/create_settr_settings.rb", "db/migrate/create_settr_settings.rb"
      end
    end
  end
end
