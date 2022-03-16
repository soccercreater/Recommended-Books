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
   user.books.create!( title: 'シュレディンガー方程式', author: 'ダニエル_フライシュ')
   user.books.create!( title: 'have_a_nice', author: 'ドーミーイン')

   user.books.each do |book|
      book.image.attach(io: File.open(Rails.root.join("app/assets/images/image_#{book.title}.jpeg")), filename: "#{book.title}.jpeg")
   end


end