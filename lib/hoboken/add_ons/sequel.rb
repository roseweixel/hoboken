module Hoboken
  module AddOns
    class Sequel < ::Hoboken::Group
      def add_gems
        gem "sequel", version: "4.6.0"
        gem "sqlite3", version: "1.3.8", group: [:development, :test]
      end

      def setup_directories
        empty_directory("db/migrate")
        empty_directory("tasks")
      end

      def copy_rake_task
        copy_file("hoboken/templates/sequel.rake", "tasks/sequel.rake")
      end

      def setup_database_connection_in_rackup_file
        insert_into_file("config.ru", after: /require "bundler\/setup"/) do
          "\nrequire \"logger\"\nrequire \"sequel\""
        end

        app_name = File.open("config.ru").grep(/run.+/).first.chomp.gsub("run ", "")

        gsub_file("config.ru", /run #{app_name}/) do
<<CODE

db = Sequel.connect(ENV["DATABASE_URL"], loggers: [Logger.new($stdout)])
Sequel.extension :migration
Sequel::Migrator.check_current(db, "db/migrate") if Dir.glob("db/migrate/*.rb").size > 0

app = #{app_name}
app.set :database, db
run app
CODE
        end
      end

      def add_database_test_helper_class
        insert_into_file("test/test_helper.rb", after: /require "test\/unit"/) do
          "\nrequire \"sequel\""
        end

        append_file("test/test_helper.rb") do
<<CODE

module Test::Database
  class TestCase < Test::Unit::TestCase
    def run(*args, &block)
      result = nil
      database.transaction(rollback: :always) { result = super }
      result
    end

    private

    def database
      @database ||= Sequel.sqlite.tap do |db|
        Sequel.extension :migration
        Sequel::Migrator.run(db, 'db/migrate') if Dir.glob("db/migrate/*.rb").size > 0
      end
    end
  end
end
CODE
        end
      end

      def reminders
        say "\nGemfile updated... don't forget to 'bundle install'"
        say <<TEXT

Notes:
* The sqlite3 gem has been installed for dev and test environments only. You will need to specify a gem to use for production.
* You will need to specify an environment variable 'DATABASE_URL' (either add it to .env or export it)
TEXT
      end
    end
  end
end
