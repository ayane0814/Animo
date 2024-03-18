# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "admin@test.com", password: "111111")

# user1 = User.create!(name: "tarou", email: "tarou@test.com", password: "111111")
# user2 = User.create!(name: "hanako", email: "hanako@test.com", password: "111111")
# user3 = User.create!(name: "aoi", email: "aoi@test.com", password: "111111")
# user4 = User.create!(name: "akari", email: "akari@test.com", password: "111111")
# user5 = User.create!(name: "kojima", email: "kojima@test.com", password: "111111")
# user6 = User.create!(name: "mimu", email: "mimu@test.com", password: "111111")
# user7 = User.create!(name: "chito", email: "chito@test.com", password: "111111")
# user8 = User.create!(name: "akio", email: "akio@test.com", password: "111111")
# user9 = User.create!(name: "kirara", email: "kirara@test.com", password: "111111")
# user10 = User.create!(name: "ruuna", email: "ruuna@test.com", password: "111111")
# user11 = User.create!(name: "zero", email: "zero@test.com", password: "111111")

# post1 = Post.new(
#     user: user1,
#     posted_title: "猫ちゃんびっくり",
#     post_content: "初めて投稿します！うちの猫がでかい魚を見てびっくりしてる顔です！最近の写真で一番のお気に入りです。",
#     tags: [Tag.find_or_create_by(name: "猫"), Tag.find_or_create_by(name: "びっくり")],
#     address: "東京都千代田区丸の内１丁目"
#     )
# post1.image.attach(io: File.open(Rails.root.join('app/assets/images/neko.jpg')), filename: 'neko.jpg')
# post1.save!
    
# post2 = Post.new(
#     user: user2,
#     posted_title: "わんこドリル",
#     post_content: "うちの子のかわいい姿を撮ろうとしたら…ｗタイミングいいのか悪いのか、すごい写真が撮れちゃいました！",
#     tags: [Tag.find_or_create_by(name: "犬"), Tag.find_or_create_by(name: "下手くそ写真"), Tag.find_or_create_by(name: "チワワ")],
#     address: "愛知県名古屋市中村区名駅１丁目１−４"
#     )
# post2.image.attach(io: File.open(Rails.root.join('app/assets/images/tdog.jpg')), filename: 'tdog.jpg')
# post2.save!
    
# post3 = Post.new(
#     user: user3,
#     posted_title: "二匹の鳩を撮ろうとしたら...",
#     post_content: "仲良しな二匹の鳩を撮っていたのですが、写真を確認したら…。鳩がひょっこり顔だしていたんですｗ最初見たとき見てはいけないものを見てしまったかと思い、うわぁあ！と声が出てしまいましたｗ",
#     tags: [Tag.find_or_create_by(name: "鳩"), Tag.find_or_create_by(name: "ホラー"), Tag.find_or_create_by(name: "ひょっこり")],
#     address: "大阪府大阪市淀川区西中島5-16-1"
#     )
# post3.image.attach(io: File.open(Rails.root.join('app/assets/images/birds.jpg')), filename: 'birds.jpg')
# post3.save!

# post4 = Post.new(
#     user: user4,
#     posted_title: "猫ちゃんびっくり",
#     post_content: "初めて投稿します！うちの猫がでかい魚を見てびっくりしてる顔です！最近の写真で一番のお気に入りです。",
#     tags: [Tag.find_or_create_by(name: "猫"), Tag.find_or_create_by(name: "びっくり")],
#     address: "新潟県見附市"
#     )
# post4.image.attach(io: File.open(Rails.root.join('app/assets/images/neko.jpg')), filename: 'neko.jpg')
# post4.save!

# post5 = Post.new(
#     user: user5,
#     posted_title: "猫ちゃんびっくり",
#     post_content: "初めて投稿します！うちの猫がでかい魚を見てびっくりしてる顔です！最近の写真で一番のお気に入りです。",
#     tags: [Tag.find_or_create_by(name: "猫"), Tag.find_or_create_by(name: "びっくり")],
#     address: "大阪府大阪市東住吉区"
#     )
# post5.image.attach(io: File.open(Rails.root.join('app/assets/images/neko.jpg')), filename: 'neko.jpg')
# post5.save!

# post6 = Post.new(
#     user: user6,
#     posted_title: "猫ちゃんびっくり",
#     post_content: "初めて投稿します！うちの猫がでかい魚を見てびっくりしてる顔です！最近の写真で一番のお気に入りです。",
#     tags: [Tag.find_or_create_by(name: "猫"), Tag.find_or_create_by(name: "びっくり")],
#     address: "東京都あきる野市"
#     )
# post6.image.attach(io: File.open(Rails.root.join('app/assets/images/neko.jpg')), filename: 'neko.jpg')
# post6.save!

# post7 = Post.new(
#     user: user7,
#     posted_title: "猫ちゃんびっくり",
#     post_content: "初めて投稿します！うちの猫がでかい魚を見てびっくりしてる顔です！最近の写真で一番のお気に入りです。",
#     tags: [Tag.find_or_create_by(name: "猫"), Tag.find_or_create_by(name: "びっくり")],
#     address: "広島県広島市東区"
#     )
# post7.image.attach(io: File.open(Rails.root.join('app/assets/images/neko.jpg')), filename: 'neko.jpg')
# post7.save!

# post8 = Post.new(
#     user: user8,
#     posted_title: "猫ちゃんびっくり",
#     post_content: "初めて投稿します！うちの猫がでかい魚を見てびっくりしてる顔です！最近の写真で一番のお気に入りです。",
#     tags: [Tag.find_or_create_by(name: "猫"), Tag.find_or_create_by(name: "びっくり")],
#     address: "東京都世田谷区"
#     )
# post8.image.attach(io: File.open(Rails.root.join('app/assets/images/neko.jpg')), filename: 'neko.jpg')
# post8.save!

# post9 = Post.new(
#     user: user9,
#     posted_title: "猫ちゃんびっくり",
#     post_content: "初めて投稿します！うちの猫がでかい魚を見てびっくりしてる顔です！最近の写真で一番のお気に入りです。",
#     tags: [Tag.find_or_create_by(name: "猫"), Tag.find_or_create_by(name: "びっくり")],
#     address: "大阪府大阪市西淀川区"
#     )
# post9.image.attach(io: File.open(Rails.root.join('app/assets/images/neko.jpg')), filename: 'neko.jpg')
# post9.save!

# post10 = Post.new(
#     user: user10,
#     posted_title: "猫ちゃんびっくり",
#     post_content: "初めて投稿します！うちの猫がでかい魚を見てびっくりしてる顔です！最近の写真で一番のお気に入りです。",
#     tags: [Tag.find_or_create_by(name: "猫"), Tag.find_or_create_by(name: "びっくり")],
#     address: "大阪府大阪市西淀川区"
#     )
# post10.image.attach(io: File.open(Rails.root.join('app/assets/images/neko.jpg')), filename: 'neko.jpg')
# post10.save!