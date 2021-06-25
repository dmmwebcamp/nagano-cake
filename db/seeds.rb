# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  
 Customer.create!(
      	email: 'a@a',
      	last_name: '工藤', first_name: '新一',
      	kana_last_name: 'クドウ', kana_first_name: 'シンイチ',
      	postal_code: '0000000',
      	address: '東京都米花市５丁目　博士の隣の家',
      	phone_number: '09011119999',
      	is_leaved: false,
      	password: 'aaaaaa',
      	password_confirmation: 'aaaaaa'
  )
  
   Customer.create!(
      	email: 'a@aa',
      	last_name: '服部', first_name: '平次',
      	kana_last_name: 'ハットリ', kana_first_name: 'ヘイジ',
      	postal_code: '0000000',
      	address: '大阪府寝屋川５丁目　和葉のの隣の家',
      	phone_number: '09011119999',
      	is_leaved: false,
      	password: 'aaaaaa',
      	password_confirmation: 'aaaaaa'
  )
  
     Customer.create!(
      	email: 'a@aaa',
      	last_name: '服部', first_name: '平次',
      	kana_last_name: 'ハットリ', kana_first_name: 'ヘイジ',
      	postal_code: '0000000',
      	address: '大阪府寝屋川５丁目　和葉のの隣の家',
      	phone_number: '09011119999',
      	is_leaved: false,
      	password: 'aaaaaa',
      	password_confirmation: 'aaaaaa'
  )
  
  Destination.create!(
  id: 1,
  customer_id: 1,
  postal_code: "1111111",
  address: "東京都米花市５丁目　毛利探偵事務所",
  recipient: "毛利小五郎"
  )
  
  Genre.create!(
  name: '組織の薬'
  )
  Genre.create!(
  name: "ケーキ"
  )
  Genre.create!(
  name: "プリン"
  )
  Genre.create!(
  name: "焼き菓子"
  )
  Genre.create!(
  name: "キャンディ"
  )

  Product.create!(
  id: 1,
  genre_id: 1,
  image_id: "47550ad3bcbac3c1e1eee6e04dbbc11831674a80a078c583df4c2c34ec39",
  name: "だんご",
  description: "大家族",
  tax_excluding_price: 2500,
  is_saled: true,
  )
  
  CartProduct.create!(
  id: 1,
  product_id: 1,
  customer_id: 1,
  quantity: 1,
  )
  
 Order.create!(
  customer_id: 1,
  total_price:　3350,
  payment_option: "クレジットカード",
  shipping_fee: 800,
  status: "発送準備中",
  postal_code: "0000000",
  address: "東京都米花市５丁目　博士の隣の家",
  recipient: "工藤新一"
  )
  
  
  
  OrderDetail.create!(
  id: 1,
  order_id: 1,
  product_id: 1,
  tax_including_price: 2500,
  quantity: 1,
  product_status: "着手不可",
  )