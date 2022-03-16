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
   user.books.create!( title: '深読みの技法', author: '小池陽慈')
   user.books.create!( title: '受験勉強で君は史上最高の自分になる', author: '関正生')
   user.books.create!( title: 'プロになるJava', author: 'きしだなおゆき')
   user.books.create!( title: '時間は存在しない', author: 'カロリ_ロヴェッリ')
   user.books.create!( title: '都市を上映せよ', author: '本田晃子')
   user.books.create!( title: '『戦後』が終わるとき', author: '坂本一哉')
   user.books.create!( title: '100歳まで生きてどうするんですか？', author: '末井昭')
   user.books.create!( title: 'やってはいけない老後対策', author: '大村大次郎')
   user.books.create!( title: 'ねこはすごい', author: '山根明弘')
   user.books.create!( title: '1日10分行政法', author: '都政新報社')
   user.books.create!( title: '『ことば』の学びに寄り添う日本語教育', author: '山内薫')
   user.books.create!( title: '司法試験&予備試験令和3年論文過去問', author: 'LEC東京リーガルマインド')
   user.books.create!( title: '登録販売者', author: '新井佑朋')
   user.books.create!( title: 'Git入門コマンドライン演習80', author: '井上顧基')
   user.books.create!( title: 'はぶく勉強法', author: '並木秀陸')
   user.books.create!( title: 'Unity_ProBuilder_ProGrids入門', author: '北野不凡')
   user.books.create!( title: '内定勝者_みんなの合格実例最強セオリー面接', author: '実務教育出版')
   user.books.create!( title: '[高卒程度]警察官採用試験問題集', author: '実務教育出版')
   user.books.create!( title: '秘書検定1級実問題集', author: '実務技能検定協会')
   user.books.create!( title: 'jQuery本格入門', author: '沖林正紀')
   user.books.create!( title: '数学書の読みかた', author: '竹山美宏')
   user.books.create!( title: 'プラネタリーヘルス_私たちと地球の未来のために', author: '河野茂')
   user.books.create!( title: 'すべての人の天文学', author: '岡村定短+芝井広')
   user.books.create!( title: '早わかり税制改正のすべて', author: '')
   user.books.create!( title: '弱キャラ友崎くんLv.4', author: '屋久ユウキ')
   user.books.create!( title: 'やはり雨は嘘をつかない', author: '皆藤黒助')
   user.books.create!( title: 'Re:ゼロから始める異世界生活', author: '長月達平')


   user.books.each do |book|
      book.image.attach(io: File.open(Rails.root.join("app/assets/images/image_#{book.title}.jpeg")), filename: "#{book.title}.jpeg")
   end


end