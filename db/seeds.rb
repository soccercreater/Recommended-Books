# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
   Admin.create!(
      email: 'admin@admin',
      password: '111111'
   )

   user = User.new(email: 'user@user',password: '111111')
   user.save
   user.books.create!( title: 'team_geek', author: 'ヴィトン.サーフ')
   user.books.create!( title: 'ABCD', author: 'ヴィトン.サーフ')
#  user = User.find_by
#    [*(1..100)].each do |index|
#       book = user.books.create!(title: index, author: index)
#       book.image.attach(io: File.open(Rails.root.join("app/assets/images/image_#{index}.jpeg")), filename: "#{index}.jpeg")
#    end
   # user.books.each.with_index(1) do |book, iiii|
   #    book.image.attach(io: File.open(Rails.root.join("app/assets/images/image_#{iiii}.jpg")))
   # end

   user.books.each do |book|
      book.image.attach(io: File.open(Rails.root.join("app/assets/images/image_#{book.title}.jpeg")), filename: "#{book.title}.jpeg")
   end


end