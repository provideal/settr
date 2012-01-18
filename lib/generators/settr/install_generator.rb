class Settr
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "install settr default files"

      source_root File.expand_path('../templates', __FILE__)

      def copy_initializer
        copy_file 'settr.rb', 'config/initializers/settr.rb'
      end
      
      def copy_migration
        run 'rake settr_engine:install:migrations'
      end
    end
  end
end