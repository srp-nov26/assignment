require 'smarter_csv'

user_csv = 'tmp/users.csv'
options = {:chunk_size => 10}

desc "Add users from csv"
task :create_users => :environment do
    SmarterCSV.process(user_csv, options) do |chunk|
        chunk.each do |data_hash|
            User.create!( data_hash )
        end
    end
end