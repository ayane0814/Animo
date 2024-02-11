# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "admin@test.com", password: "111111")

user1 = User.create!(name: "太郎", email: "tarou@test.com", password: "111111")
user2 = User.create!(name: "花子", email: "hanako@test.com", password: "111111")
user3 = User.create!(name: "碧", email: "aoi@test.com", password: "111111")

post1 = Post.new(
    user: user1,
    posted_title: "猫ちゃんびっくり",
    post_content: "初めて投稿します！うちの猫がでかい魚を見てびっくりしてる顔です！最近の写真で一番のお気に入りです。",
    tags: [Tag.find_or_create_by(name: "猫"), Tag.find_or_create_by(name: "びっくり")]
    )
post1.image.attach(io: File.open(Rails.root.join('app/assets/images/neko.jpg')), filename: 'neko.jpg')
post1.save!
    
post2 = Post.new(
    user: user2,
    posted_title: "わんこドリル",
    post_content: "うちの子のかわいい姿を撮ろうとしたら…ｗタイミングいいのか悪いのか、すごい写真が撮れちゃいました！",
    tags: [Tag.find_or_create_by(name: "犬"), Tag.find_or_create_by(name: "下手くそ写真"), Tag.find_or_create_by(name: "チワワ")]
    )
post2.image.attach(io: File.open(Rails.root.join('app/assets/images/tdog.jpg')), filename: 'tdog.jpg')
post2.save!
    
post3 = Post.new(
    user: user3,
    posted_title: "二匹の鳩を撮ろうとしたら...",
    post_content: "仲良しな二匹の鳩を撮っていたのですが、写真を確認したら…。鳩がひょっこり顔だしていたんですｗ最初見たとき見てはいけないものを見てしまったかと思い、うわぁあ！と声が出てしまいましたｗ",
    tags: [Tag.find_or_create_by(name: "鳩"), Tag.find_or_create_by(name: "ホラー"), Tag.find_or_create_by(name: "ひょっこり")]
    )
post3.image.attach(io: File.open(Rails.root.join('app/assets/images/birds.jpg')), filename: 'birds.jpg')
post3.save!