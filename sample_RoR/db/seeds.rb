# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)User.create!(username: 'admin', password: '123', first_name: 'admin', last_name: 'istrator', email_is_confirmed: true, email: 'cameron.p.buckingham@gmail.com', bio: 'i am god', admin: true)


User.create!(name: "cam", email: "cameron.p.buckingham@gmail.com", password: "cam", admin: true)


# require 'csv'
# CSV.foreach(Rails.root.join("db/seeds_data/coders.csv"), headers: true) do |row|
#   Coder.find_or_create_by(id: row[0], name: row[1], email: row[2], github_username: row[3])
# end
