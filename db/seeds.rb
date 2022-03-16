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
   user.books.create!( title: 'Schrodinger equation', author: 'Daniel_Fleisch')
   user.books.create!( title: 'have_a_nice', author: 'dormy inn')
   user.books.create!( title: 'The art of deep reading', author: 'Yoji Koike')
   user.books.create!( title: 'Study for the exam and you will become the best you ever were', author: 'Masao Seki')
   user.books.create!( title: 'Java Going Pro', author: 'Naoyuki Kishida')
   user.books.create!( title: 'Time does not exist', author: 'Caroli_Rovelli')
   user.books.create!( title: 'Screen the City', author: 'Akiko Honda')
   user.books.create!( title: 'When the postwar period ends', author: 'Kazuya Sakamoto')
   user.books.create!( title: 'What are you going to do when you live to be 100 years old', author: 'Akira Suei')
   user.books.create!( title: 'What not to do', author: 'Daijiro Omura')
   user.books.create!( title: 'Cats are amazing', author: 'Akihiro Yamane')
   user.books.create!( title: '10 Minutes a Day Administrative Law', author: 'Metropolitan Government News Agency')
   user.books.create!( title: 'Japanese language education that accompanies language learning', author: 'Kaoru Yamauchi')
   user.books.create!( title: 'bar examination', author: 'LEC Tokyo Legal Mind')
   user.books.create!( title: 'registered sales person', author: 'Yuho Arai')
   user.books.create!( title: 'Introduction to Git Command Line Exercise 80', author: 'Kuki Inoue')
   user.books.create!( title: 'abbreviated study method', author: 'Namiki Hidoru')
   user.books.create!( title: 'Unity_ProBuilder_ProGrids', author: 'Kitano Bufan')
   user.books.create!( title: 'unofficial winner', author: 'Metropolitan Government News Agency')
   user.books.create!( title: 'Police Recruitment Examination Questions', author: 'Metropolitan Government News Agency')
   user.books.create!( title: 'Secretarial Examination Level 1 Actual Questions', author: 'Practical Skills Test Association')
   user.books.create!( title: 'Full-fledged introduction to jQuery', author: 'Masaki Okibayashi')
   user.books.create!( title: 'How to read a math book', author: 'Takeyama Mihiro')
   user.books.create!( title: 'planetary health', author: 'Shigeru Kono')
   user.books.create!( title: 'Astronomy for All', author: 'Hiroshi Shibai')
   user.books.create!( title: 'All about Tax Reform in a Nutshell', author: '')
   user.books.create!( title: 'Weak character Tomozaki_kun Lv.4', author: 'Yuki Yaku')
   user.books.create!( title: 'Rain does not lie', author: 'Kaito Kurosuke')
   user.books.create!( title: 'Starting from Zero Another World Life', author: 'Tatsuhei Nagatsuki')


   user.books.each do |book|
      book.image.attach(io: File.open(Rails.root.join("app/assets/images/image_#{book.title}.jpeg")), filename: "#{book.title}.jpeg")
   end


end