desc "Clearing old menu items, loading new items"
task :update_daily_menu => :environment do
    puts "Updating daily menus..."
    ParserWorker.new.perform
    puts "Update complete."
end