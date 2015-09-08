# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


MULTIPLIER = 10
names = ["Abbie","Brice","Alena", "Kenny", "Tod", "Ellen","Ashlie", "Huey"]
MULTIPLIER.times do |i|
  Movie.create(name: "random movie #{i + 1}", release_date: rand(10).years.ago)
end

(MULTIPLIER * 5).times do
  Review.create(reviewer_name: names.sample,
                review_text: " Integer eros sit bibendum ultricies, sapien eget. Porttitor velit sit vitae porta, sem etiam sociis praesent, ultrices eros quisque metus vel augue malesuada. Vel semper commodo. At quis nascetur sit feugiat suspendisse et, diam aliquam. Scelerisque enim eget metus, sit ultricies pellentesque parturient ornare ridiculus eget, congue suscipit, ut integer sociosqu.",
                title: " Faucibus fusce eu suspendisse",
                review_date: rand(9).years.ago,
                movie_id: rand(MULTIPLIER + 1))
end

