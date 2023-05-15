# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(
  email: 'aaaaaa@gmail.com',
  password: 'aaaaaa',
  name: "わんごろう",
  introduction: "いぬいぬです",
  )
user.profile_image.attach(io: File.open('app/assets/images/dog.png'), filename: 'dog.png')

user.books.create!(
  title: "いぬの冒険",
  body: "いぬが飛んでは跳ね回る！",
  user_id: user.id
  )