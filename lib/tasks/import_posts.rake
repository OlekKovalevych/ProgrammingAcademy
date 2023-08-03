require 'csv'

namespace :import do
  desc 'Import data from the CSV file'
  task posts: :environment do
    file_path = '/Users/learn_coding/csv/imported_posts.csv'

    CSV.foreach(file_path, headers: true) do |row|
      post_data = row.to_hash
      Post.create(post_data)
    end

    puts 'New posts imported!'
  end
end
