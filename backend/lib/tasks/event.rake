require 'smarter_csv'

user_csv = 'tmp/events.csv'
options = {:chunk_size => 10}

desc "Add events from csv"
task :create_events => :environment do
    SmarterCSV.process(user_csv, options) do |chunk|
        chunk.each do |data_hash|
            data_hash[:user_id] = rand(1..20)
            Event.create!( data_hash )
        end
    end
end