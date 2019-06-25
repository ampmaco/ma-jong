# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  User.create!(
    email:     'ampmaco@gmail.com',
    password:  'ampmaco',
    user_name: '管理者',
    addres:    '東京都渋谷区神南１丁目１９−１１',
    admin:     'true',
    )