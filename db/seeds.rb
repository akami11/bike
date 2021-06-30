# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "管理者",
             email: "admin@example.jp",
             password:  "12345678",
             password_confirmation: "12345678",
             admin: true)
             
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               admin: false)
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
             
             
Place.create(area: "北海道")
Place.create(area: "青森")
Place.create(area: "秋田")
Place.create(area: "岩手")
Place.create(area: "宮城")
Place.create(area: "山形")
Place.create(area: "福島")
Place.create(area: "栃木")
Place.create(area: "茨城")
Place.create(area: "群馬")
Place.create(area: "埼玉")
Place.create(area: "千葉")
Place.create(area: "東京")
Place.create(area: "神奈川")
Place.create(area: "新潟")
Place.create(area: "富山")
Place.create(area: "石川")
Place.create(area: "福井")
Place.create(area: "山梨")
Place.create(area: "長野")
Place.create(area: "岐阜")
Place.create(area: "静岡")
Place.create(area: "愛知")
Place.create(area: "三重")
Place.create(area: "滋賀")
Place.create(area: "京都")
Place.create(area: "大阪")
Place.create(area: "兵庫")
Place.create(area: "奈良")
Place.create(area: "和歌山")
Place.create(area: "鳥取")
Place.create(area: "島根")
Place.create(area: "岡山")
Place.create(area: "広島")
Place.create(area: "山口")
Place.create(area: "徳島")
Place.create(area: "香川")
Place.create(area: "愛媛")
Place.create(area: "高知")
Place.create(area: "福岡")
Place.create(area: "佐賀")
Place.create(area: "長崎")
Place.create(area: "熊本")
Place.create(area: "大分")
Place.create(area: "宮崎")
Place.create(area: "鹿児島")
Place.create(area: "沖縄")