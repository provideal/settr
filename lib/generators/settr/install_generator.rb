class Settr
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "install settr default files"

      source_root File.expand_path('../templates', __FILE__)

      def copy_initializer
        copy_file 'settr.rb', 'config/initializers/settr.rb'
      end
      
      def copy_and_run_migration
        run 'rake settr_engine:install:migrations'
        run 'rake db:migrate'
      end
    end
  end
end