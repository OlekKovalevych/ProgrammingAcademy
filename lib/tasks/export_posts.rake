require 'csv'

namespace :export do
  desc 'Export data about posts to the CSV file'
  task posts: :environment do
    file_path = '/Users/learn_coding/csv/exported_posts.csv'

    CSV.open(file_path, 'wb', col_sep: ';') do |csv|
      csv << ['title', 'created_at', 'author']

      Post.all.each do |post|
        csv << [post.title, post.created_at, post.author.email]
      end
    end

    puts 'Data exported!'
  end
end
