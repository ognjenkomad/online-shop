# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.where(admin: true).take


user.addresses.find_or_create_by(street: 'Spasovdanska', street_number: 23, town: 'Istocno Sarajevo', state: 'Republika Srpska', post_code: 77831)



user.articles.find_or_create_by(
  name: 'Samsung S6', 
  image_url: 'https://images.pexels.com/photos/47261/pexels-photo-47261.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  description: 'OS	Android 5.0.2 (Lollipop), upgradable to Android 8.0 (Oreo); TouchWiz UI
    Chipset	Exynos 7420 Octa (14 nm)
    CPU	Octa-core (4x2.1 GHz Cortex-A57 & 4x1.5 GHz Cortex-A53)
    GPU	Mali-T760MP8',
  weight: 300,
  price: 600
)

user.articles.find_or_create_by(
  name: 'Huawei P30 Pro', 
  image_url: 'https://i.gadgets360cdn.com/products/large/1553612597_635_huawei_p30_pro.jpg',
  description: 'OS	Android 9.0 (Pie); EMUI 9.1
  Chipset	HiSilicon Kirin 980 (7 nm)
  CPU	Octa-core (2x2.6 GHz Cortex-A76 & 2x1.92 GHz Cortex-A76 & 4x1.8 GHz Cortex-A55)
  GPU	Mali-G76 MP10',
  weight: 370,
  price: 1600
)

user.articles.find_or_create_by(
  name: 'Iphone 11', 
  image_url: 'https://icdn5.digitaltrends.com/image/digitaltrends/iphone11-review-510x0.jpg',
  description: 'OS	iOS 13, upgradable to iOS 13.2
  Chipset	Apple A13 Bionic (7 nm+)
  CPU	Hexa-core (2x2.65 GHz Lightning + 4x1.8 GHz Thunder)
  GPU	Apple GPU (4-core graphics)',
  weight: 320,
  price: 2300
)

user.articles.find_or_create_by(
  name: 'Samsung S10', 
  image_url: 'https://fdn2.gsmarena.com/vv/pics/samsung/samsung-galaxy-s10-plus-1.jpg',
  description: 'OS	Android 9.0 (Pie); One UI
  Chipset	Exynos 9820 (8 nm) - EMEA/LATAM
  Qualcomm SDM855 Snapdragon 855 (7 nm) - USA/China
  CPU	Octa-core (2x2.73 GHz Mongoose M4 & 2x2.31 GHz Cortex-A75 & 4x1.95 GHz Cortex-A55) - EMEA/LATAM
  Octa-core (1x2.84 GHz Kryo 485 & 3x2.42 GHz Kryo 485 & 4x1.78 GHz Kryo 485) - USA/China
  GPU	Mali-G76 MP12 - EMEA/LATAM
  Adreno 640 - USA/China',
  weight: 350,
  price: 1900
)

user.articles.find_or_create_by(
  name: 'Honor 9X', 
  image_url: 'https://fdn2.gsmarena.com/vv/pics/honor/honor-9x-global-0.jpg',
  description: 'OS	Android 9.0 (Pie); EMUI 9.1
  Chipset	HiSilicon Kirin 710F (12 nm)
  CPU	Octa-core (4x2.2 GHz Cortex-A73 & 4x1.7 GHz Cortex-A53)
  GPU	Mali-G51 MP4',
  weight: 393,
  price: 900
)

user.articles.find_or_create_by(
  name: 'Xiaomi Mi Note 10', 
  image_url: 'https://fdn2.gsmarena.com/vv/pics/xiaomi/xiaomi-mi-cc9-pro-r1.jpg',
  description: 'OS	Android 9.0 (Pie); MIUI 11
  Chipset	Qualcomm SDM730 Snapdragon 730G (8 nm)
  CPU	Octa-core (2x2.2 GHz Kryo 470 Gold & 6x1.8 GHz Kryo 470 Silver)
  GPU	Adreno 618',
  weight: 333,
  price: 1540
)

user.articles.find_or_create_by(
  name: 'Xiaomi Mi 9', 
  image_url: 'https://fdn2.gsmarena.com/vv/bigpic/xiaomi-mi-9-.jpg',
  description: 'OS	Android 9.0 (Pie); MIUI 11
  Chipset	Qualcomm SDM730 Snapdragon 730G (8 nm)
  CPU	Octa-core (2x2.2 GHz Kryo 470 Gold & 6x1.8 GHz Kryo 470 Silver)
  GPU	Adreno 618',
  weight: 332,
  price: 1340
)

user.articles.find_or_create_by(
  name: 'Xiaomi Mi 9 Explorer', 
  image_url: 'https://fdn2.gsmarena.com/vv/bigpic/xiaomi-mi-9-explore.jpg',
  description: 'OS	Android 9.0 (Pie); MIUI 11
  Chipset	Qualcomm SDM730 Snapdragon 730G (8 nm)
  CPU	Octa-core (2x2.2 GHz Kryo 470 Gold & 6x1.8 GHz Kryo 470 Silver)
  GPU	Adreno 618',
  weight: 332,
  price: 1740
)




user.articles.find_or_create_by(
  name: 'Huawei P20 Pro', 
  image_url: 'https://fdn2.gsmarena.com/vv/bigpic/huawei-p20-pro-.jpg',
  description: 'OS	Android 9.0 (Pie); EMUI 9.1
  Chipset	HiSilicon Kirin 980 (7 nm)
  CPU	Octa-core (2x2.6 GHz Cortex-A76 & 2x1.92 GHz Cortex-A76 & 4x1.8 GHz Cortex-A55)
  GPU	Mali-G76 MP10',
  weight: 370,
  price: 650
)

user.articles.find_or_create_by(
  name: 'Huawei Mate 30 Pro', 
  image_url: 'https://fdn2.gsmarena.com/vv/bigpic/huawei-mate30-pro-.jpg',
  description: 'OS	iOS 13, upgradable to iOS 13.2
  Chipset	Apple A13 Bionic (7 nm+)
  CPU	Hexa-core (2x2.65 GHz Lightning + 4x1.8 GHz Thunder)
  GPU	Apple GPU (4-core graphics)',
  weight: 320,
  price: 1900
)

user.articles.find_or_create_by(
  name: 'Samsung S10', 
  image_url: 'https://fdn2.gsmarena.com/vv/pics/samsung/samsung-galaxy-s10-plus-1.jpg',
  description: 'OS	Android 9.0 (Pie); One UI
  Chipset	Exynos 9820 (8 nm) - EMEA/LATAM
  Qualcomm SDM855 Snapdragon 855 (7 nm) - USA/China
  CPU	Octa-core (2x2.73 GHz Mongoose M4 & 2x2.31 GHz Cortex-A75 & 4x1.95 GHz Cortex-A55) - EMEA/LATAM
  Octa-core (1x2.84 GHz Kryo 485 & 3x2.42 GHz Kryo 485 & 4x1.78 GHz Kryo 485) - USA/China
  GPU	Mali-G76 MP12 - EMEA/LATAM
  Adreno 640 - USA/China',
  weight: 350,
  price: 1900
)

user.articles.find_or_create_by(
  name: 'Honor 8X', 
  image_url: 'https://fdn2.gsmarena.com/vv/pics/honor/honor-9x-global-0.jpg',
  description: 'OS	Android 9.0 (Pie); EMUI 9.1
  Chipset	HiSilicon Kirin 710F (12 nm)
  CPU	Octa-core (4x2.2 GHz Cortex-A73 & 4x1.7 GHz Cortex-A53)
  GPU	Mali-G51 MP4',
  weight: 393,
  price: 900
)

user.articles.find_or_create_by(
  name: 'Samsung Galaxy Note10+', 
  image_url: 'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note10-plus-.jpg',
  description: 'OS	Android 9.0 (Pie); MIUI 11
  Chipset	Qualcomm SDM730 Snapdragon 730G (8 nm)
  CPU	Octa-core (2x2.2 GHz Kryo 470 Gold & 6x1.8 GHz Kryo 470 Silver)
  GPU	Adreno 618',
  weight: 333,
  price: 2540
)

user.articles.find_or_create_by(
  name: 'Xiaomi Mi 8', 
  image_url: 'https://fdn2.gsmarena.com/vv/bigpic/xiaomi-mi-9-.jpg',
  description: 'OS	Android 9.0 (Pie); MIUI 11
  Chipset	Qualcomm SDM730 Snapdragon 730G (8 nm)
  CPU	Octa-core (2x2.2 GHz Kryo 470 Gold & 6x1.8 GHz Kryo 470 Silver)
  GPU	Adreno 618',
  weight: 332,
  price: 1340
)

user.articles.find_or_create_by(
  name: 'Xiaomi Mi 8 Explorer', 
  image_url: 'https://fdn2.gsmarena.com/vv/bigpic/xiaomi-mi-9-explore.jpg',
  description: 'OS	Android 9.0 (Pie); MIUI 11
  Chipset	Qualcomm SDM730 Snapdragon 730G (8 nm)
  CPU	Octa-core (2x2.2 GHz Kryo 470 Gold & 6x1.8 GHz Kryo 470 Silver)
  GPU	Adreno 618',
  weight: 332,
  price: 1740
)

