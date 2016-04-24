task :update_daily_menu do
    desc "Clearing old menu items, loading new items"
    task :update_menu do#:environment do
        puts "Updating daily menus..."
        ParserWorker.new.perform
        puts "Update complete."
    end
end