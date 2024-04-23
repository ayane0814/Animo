# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "admin@test.com", password: "111111")

user1 = User.create!(name: "tarou", email: "tarou@test.com", password: "111111")
user2 = User.create!(name: "hanako", email: "hanako@test.com", password: "222222")
user3 = User.create!(name: "aoi", email: "aoi@test.com", password: "333333")
user4 = User.create!(name: "akari", email: "akari@test.com", password: "444444")
user5 = User.create!(name: "kojima", email: "kojima@test.com", password: "555555")
user6 = User.create!(name: "mimu", email: "mimu@test.com", password: "666666")
user7 = User.create!(name: "chito", email: "chito@test.com", password: "777777")
user8 = User.create!(name: "akio", email: "akio@test.com", password: "888888")
user9 = User.create!(name: "kirara", email: "kirara@test.com", password: "999999")
user10 = User.create!(name: "ruuna", email: "ruuna@test.com", password: "101010")
user11 = User.create!(name: "zero", email: "zero@test.com", password: "111111")

post1 = Post.new(
    user: user1,
    posted_title: "ふてくされてる",
    post_content: "初めて投稿します！私が仕事してるから構ってあげれなくて見に行ったらふてくされていましたｗかわいいうちの子を見てください！",
    tags: [Tag.find_or_create_by(name: "猫"), Tag.find_or_create_by(name: "ぶさかわ")],
    address: "東京都千代田区丸の内１丁目",
    is_display: "published"
    )
post1.image.attach(io: File.open(Rails.root.join('app/assets/images/cat1.jpg')), filename: 'cat1.jpg')
post1.save!
    
post2 = Post.new(
    user: user2,
    posted_title: "相談乗ってやるよ",
    post_content: "ふわちゃんおとなしいからサングラスかけても落ち着いています。相談乗ってくれそうな渋ふわちゃんです。",
    tags: [Tag.find_or_create_by(name: "犬"), Tag.find_or_create_by(name: "ふわちゃん"), Tag.find_or_create_by(name: "プードル")],
    address: "愛知県名古屋市中村区名駅１丁目１−４",
    is_display: "published"
    )
post2.image.attach(io: File.open(Rails.root.join('app/assets/images/dog1.jpg')), filename: 'dog1.jpg')
post2.save!
    
post3 = Post.new(
    user: user3,
    posted_title: "写真下手くそ選手権だったら一位",
    post_content: "かわいいモカ君を撮ろうとしたら、タイミング悪くブルブルしてるモカ君が撮れましたｗしかも、めっちゃ目かっぴらいている！
                しかもしかも、ピントあってないしｗ写真下手くそすぎました！！！けど、面白くとれたので面白い沢山くれたら嬉しいです！",
    tags: [Tag.find_or_create_by(name: "モカ君"), Tag.find_or_create_by(name: "チワワ"), Tag.find_or_create_by(name: "写真下手くそ選手権")],
    address: "大阪府大阪市淀川区西中島5-16-1",
    is_display: "published"
    )
post3.image.attach(io: File.open(Rails.root.join('app/assets/images/dog2.jpg')), filename: 'dog2.jpg')
post3.save!

post4 = Post.new(
    user: user4,
    posted_title: "笑ってるフクロウ",
    post_content: "フクロウ動物園にいた子が、笑顔で出迎えてくれていました！
                とてもおとなしく、餌やり体験をしたのですがぺろっと全部食べてしまいましたｗとても癒されたので、行ったことない方ぜひ行ってみてください！",
    tags: [Tag.find_or_create_by(name: "フクロウ動物園"), Tag.find_or_create_by(name: "笑顔")],
    address: "新潟県見附市",
    is_display: "published"
    )
post4.image.attach(io: File.open(Rails.root.join('app/assets/images/tori1.jpg')), filename: 'tori1.jpg')
post4.save!

post5 = Post.new(
    user: user5,
    posted_title: "バナナとられた！！！めっちゃ悪い顔！",
    post_content: "大阪の動物園来たんだけど、バナナ持ち歩いてたらサルに取られた！！！取られただけならいいんだけど、取った後のこの顔！！！
                絶対悪いとわかってやってるでしょうｗ餌用のバナナだからいいけどさ、この顔本当に！許せんｗｗｗ",
    tags: [Tag.find_or_create_by(name: "サル"), Tag.find_or_create_by(name: "大阪動物園")],
    address: "大阪府大阪市東住吉区",
    is_display: "published"
    )
post5.image.attach(io: File.open(Rails.root.join('app/assets/images/saru1.jpg')), filename: 'saru1.jpg')
post5.save!

post6 = Post.new(
    user: user3,
    posted_title: "写真下手くそ選手権第二弾！",
    post_content: "まさかの似たような写真が取れました！先ほどの写真の後ろにいたクロくんです！",
    tags: [Tag.find_or_create_by(name: "クロくん"), Tag.find_or_create_by(name: "写真下手くそ選手権")],
    address: "大阪府大阪市淀川区西中島5-16-1",
    is_display: "published"
    )
post6.image.attach(io: File.open(Rails.root.join('app/assets/images/dog3.jpg')), filename: 'dog3.jpg')
post6.save!

# post7 = Post.new(
#     user: user7,
#     posted_title: "猫ちゃんびっくり",
#     post_content: "初めて投稿します！うちの猫がでかい魚を見てびっくりしてる顔です！最近の写真で一番のお気に入りです。",
#     tags: [Tag.find_or_create_by(name: "猫"), Tag.find_or_create_by(name: "びっくり")],
#     address: "広島県広島市東区",
#     is_display: "published"
#     )
# post7.image.attach(io: File.open(Rails.root.join('app/assets/images/neko.jpg')), filename: 'neko.jpg')
# post7.save!

# post8 = Post.new(
#     user: user8,
#     posted_title: "猫ちゃんびっくり",
#     post_content: "初めて投稿します！うちの猫がでかい魚を見てびっくりしてる顔です！最近の写真で一番のお気に入りです。",
#     tags: [Tag.find_or_create_by(name: "猫"), Tag.find_or_create_by(name: "びっくり")],
#     address: "東京都世田谷区",
#     is_display: "published"
#     )
# post8.image.attach(io: File.open(Rails.root.join('app/assets/images/neko.jpg')), filename: 'neko.jpg')
# post8.save!

# post9 = Post.new(
#     user: user9,
#     posted_title: "猫ちゃんびっくり",
#     post_content: "初めて投稿します！うちの猫がでかい魚を見てびっくりしてる顔です！最近の写真で一番のお気に入りです。",
#     tags: [Tag.find_or_create_by(name: "猫"), Tag.find_or_create_by(name: "びっくり")],
#     address: "大阪府大阪市西淀川区",
#     is_display: "published"
#     )
# post9.image.attach(io: File.open(Rails.root.join('app/assets/images/neko.jpg')), filename: 'neko.jpg')
# post9.save!

# post10 = Post.new(
#     user: user10,
#     posted_title: "猫ちゃんびっくり",
#     post_content: "初めて投稿します！うちの猫がでかい魚を見てびっくりしてる顔です！最近の写真で一番のお気に入りです。",
#     tags: [Tag.find_or_create_by(name: "猫"), Tag.find_or_create_by(name: "びっくり")],
#     address: "大阪府大阪市西淀川区",
#     is_display: "published"
#     )
# post10.image.attach(io: File.open(Rails.root.join('app/assets/images/neko.jpg')), filename: 'neko.jpg')
# post10.save!