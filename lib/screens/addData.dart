import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference restaurants =
        FirebaseFirestore.instance.collection('restaurants');
    // CollectionReference temples = FirebaseFirestore.instance.collection('temples');
    CollectionReference cafes = FirebaseFirestore.instance.collection('cafes');
    CollectionReference hotels = FirebaseFirestore.instance.collection('hotels');
    CollectionReference places =
        FirebaseFirestore.instance.collection('places');


    Future<void> addPlace() async {
      var names = [
        'Movenpick Resort Aswan',
        'Sofitel Legend Old Cataract Aswan',
        'Philae Hotel',
        'Nubian Holiday House Aswan',
        'Basmatic Nubian Guest House',
        'Kato Dool Nubian House',
        'Nubian Lotus',
        'Basma Executive Club',
        'Bet El Kerem',
        'Eco Nubia',
        'Anakato Artika',
        'Nubian Beach',
        'Marhaba Palace Hotel',
        'Abo ORabi Guest House',
        'Dawy House',
        'Basma Hotel',
        'Hapi Hotel',
        'Pyramisa Isis Corniche Hotel',
        'Baba Dool',
        'Marhaba Palace Hotel',
        'Orchida St George Hotel',
        'Takela Kato',
        'Baba Dool',
        'New Abu Simbel Hotel ',
        'Cleopatra Hotel',
        'Citymax Hotel Aswan'
      ];
      var desc = [
        'Nestled on its own Arcadian island in the Nile and a five-minute boat ride from the center of Aswan and its ancient monuments, the MÃ¶venpick Resort Aswan is a photographerâ€™s delight. Nearby Kitchenerâ€™s Island is the setting for a mature botanical garden with species from all points of the globe. The resort is a 25-minute drive from Aswan Airport and then a 5 minute boat trip across the Nile to Elephantine Island. Opposite the city of Aswan, the MÃ¶venpick Resort Aswan provides a tranquil environment of lush tropical gardens and magnificent views of the river',
        'Hotel Complex encompassing famous Victorian-style Cataract Hotel & adjacent high-rise New Cataract Hotel (1963).',
        'Philae Hotel is an excellent choice for travelers visiting Aswan, offering a family-friendly environment alongside many helpful amenities designed to enhance your stay. Guest rooms offer a flat screen TV, a refrigerator, and air conditioning, and Philae Hotel makes getting online easy as free wifi is available. You can also take advantage of some of the amenities offered by the hotel, including a 24 hour front desk, room service, and baggage storage. In addition, guests can enjoy a hot tub and breakfast during their visit. As an added convenience, there is free parking available to guests. Nearby landmarks such as El-Tabia Mosque (0.3 mi) and Archangel Michaelâ€™s Coptic Orthodox Cathedral (0.5 mi) make Philae Hotel a great place to stay when visiting Aswan. While in Aswan be sure to experience local shrimp favorites at Chef Khalil. If youâ€™re looking for things to do, you can check out Temple of Philae (0.5 mi), Nubian Museum (0.7 mi), or Aswan Botanical Garden (0.6 mi), which are popular attractions amongst tourists, and they are all within walking distance.',
        'With seven spacious rooms and a roof terrace overlooking the beautiful river Nile, we have converted our old family home into a beautiful guesthouse. Our family guesthouse is located in the heart of our Nubian Village on the West Bank of Aswan. In contrast to the busy and loud East Bank, the West Bank is quiet and green where the Nubian people live in their colour villages and where the desert meets the Nile. A short walk, only 500 meter, will take you to the ferry (2 EGP) that will take you to the heart of Aswan in about 10 minutes. Aswan train station is a 300 meter walk from the ferry that will take you to the West Bank. Our main aim is to let you experience Nubian hospitality and to make sure your stay is both enjoyable and relaxing. If requested we would love to show you our beloved Nubian villages and city of Aswan in any way you would require. We are happy to arrange you a private tour, both on land and on the Nile, through our network of local guides and drivers.',
        'Set in Aswan, Basmatic Nubian Guest House offers beachfront accommodation 23 km from Aga Khan Mausoleum and offers various facilities, such as a bar, a garden and a terrace.',
        'Kato Dool Nubian House is an excellent choice for travelers visiting Aswan, offering a romantic environment alongside many helpful amenities designed to enhance your stay. Nearby landmarks such as Archangel Michaelâ€™s Coptic Orthodox Cathedral (2.3 mi) and Unfinished Obelisk (2.3 mi) make Kato Dool Nubian House a great place to stay when visiting Aswan. Rooms at Kato Dool Nubian House provide air conditioning, and getting online is easy, with free internet access available. In addition, Kato Dool Nubian House offers an on-site restaurant, which will help make your Aswan trip additionally gratifying. And, as an added convenience, there is free parking available to guests. If you like Mediterranean restaurants, Kato Dool Nubian House is conveniently located near Kato Dool Restaurant & cafe and Solaih Nubian Restaurant. If youâ€™re looking for things to do, you can check out Nubian Village (0.1 mi), which is a popular attraction amongst tourists, and it is within walking distance. Enjoy your stay in Aswan!',
        'Featuring a garden and a terrace, Nubian Lotus is situated on Elephantine Island, a 10-minute walk from Aswan Christian Cathedral. Featuring on-site dining, the bed and breakfast has air-conditioned rooms with a private bathroom. El-Tabia Mosque is...',
        'Basma Executive Club is located on the highest point of Aswan, next to the famous pharaonic monuments and overlooking the beautiful greenery and the amazing Nile views.',
        'Located in front of the Tombs of the Nobles in Aswan, Bet El Kerem offers rooms with air conditioning. Its rooftop terrace has panoramic views of the desert and the Nile. The rooms are simply furnished and are located in two buildings. One building has a view to the Nile, while the other looks onto the desert and Tombs of Nobles. All rooms have private bathrooms. Guests can relax at the rooftop terrace. Guests can enjoy local Nubian dishes as well as international cuisine at the restaurant. It is also possible to participate in a Nubian cooking workshop. Bet El Keremâ€™s 24-hour reception can help arrange various activities, such as a camel safari, sailing trips, and horse riding. The guest house also offers bicycle rental. Guesthouse Bet El Kerem is within walking distance of the local ferry, which brings guests in 10 minutes to Aswanâ€™s city centre.',
        'Eco Nubia is a new Ecolodge aiming to promote the eco-friendly lodging with authentic Nubian food and beverages, and unique beach area directly on the Nile surrounded by the amazing nature of the island. The project also includes a community center that is suitable for organizing events with a unique view overlooking the famous Philae temple. We help original inhabitants of the island to rebuild their houses, using the same old techniques of Nubian Architecture and the same materials of Rocks and Mud, in parallel we develop',
        'See why so many travelers make Anakato Artika their inn of choice when visiting Aswan. Providing an ideal mix of value, comfort and convenience, it offers a budget friendly setting with an array of amenities designed for travelers like you. The rooms offer air conditioning, a minibar, and a mosquito net, and getting online is possible, as free wifi is available, allowing you to rest and refresh with ease. Anakato Artika features a 24 hour front desk, baggage storage, and shops. In addition, as a valued Anakato Artika guest, you can enjoy an on-site restaurant that is available on-site. Guests arriving by vehicle have access to free parking. For those interested in checking out popular landmarks while visiting Aswan, Anakato Artika is located a short distance from El-Tabia Mosque (0.6 mi) and Sehel Island (1.6 mi). During your visit, be sure to check out a popular Aswan lobster restaurant such as 1902 Restaurant, which is a short distance from Anakato Artika. Aswan is also home to Sound and Light Show - Philae, a popular that is not too far from Anakato Artika. Weâ€™re sure youâ€™ll enjoy your stay at Anakato Artika as you experience all of the things Aswan has to offer.',
        'See why so many travelers make Nubian Beach their guest house of choice when visiting Aswan. Providing an ideal mix of value, comfort and convenience, it offers a budget friendly setting with an array of amenities designed for travelers like you. Nubian Beach is a budget friendly guest house offering air conditioning, a refrigerator, and a kitchenette in the rooms, and it is easy to stay connected during your stay as free wifi is offered to guests. The guest house features a 24 hour front desk, a concierge, and express check-in and check-out. Plus, guests can enjoy an on-site restaurant, which has made this a popular choice among travelers visiting Aswan. For guests with a vehicle, free parking is available. Close to Nubian Village (2.1 mi), a popular Aswan landmark, Nubian Beach is a great destination for tourists. If you are looking for a good Mediterranean restaurant, you may want to check out Solaih Nubian Restaurant or Kato Dool Restaurant & cafe while staying at Nubian Beach Looking to explore? Then look no further than Sound and Light Show - Philae (0.8 mi), which is a popular Aswan attraction â€“ and it is conveniently located within walking distance of the guest house. Weâ€™re sure youâ€™ll enjoy your stay at Nubian Beach as you experience all of the things Aswan has to offer.',
        "Looking for a place to stay in Aswan? Then look no further than Marhaba Palace Hotel, a hotel that brings the best of Aswan to your doorstep. Guest rooms offer air conditioning, and Marhaba Palace Hotel makes getting online easy as wifi is available. You can also take advantage of some of the amenities offered by the hotel, including a 24 hour front desk, room service, and a concierge. In addition, guests can enjoy a pool and free breakfast during their visit. As an added convenience, there is street parking available to guests. Given the close proximity of popular landmarks, such as Temple of Philae (1.3 mi) and Archangel Michaelâ€™s Coptic Orthodox Cathedral (1.3 mi), guests of Marhaba Palace Hotel can easily experience some of Aswan's most well known attractions. While in Aswan be sure to experience local shrimp favorites at Chef Khalil. During your visit, be sure to check out popular attractions like Aswan Botanical Garden (0.8 mi), Sehel Island (0.4 mi), and El-Tabia Mosque (0.7 mi), which are all within walking distance of the hotel. Weâ€™re sure youâ€™ll enjoy your stay at Marhaba Palace Hotel as you experience everything Aswan has to offer.",
        'Situated in Aswan, 6 km from Aga Khan Mausoleum, Abo ORabi Guest House features accommodation with a restaurant, free private parking, a shared lounge and a garden.',
        'Good Hotel',
        "Finding an ideal romantic hotel in Aswan does not have to be difficult. Welcome to Basma Hotel, a nice option for travelers like you. Close to some of Aswan's most popular landmarks, such as Nubian Village (1.9 mi) and Sehel Island (2.1 mi), Basma Hotel is a great destination for tourists. Rooms at Basma Hotel provide a flat screen TV, air conditioning, hair drier and a minibar, - while staying at Basma Hotel guests can stay connected with free internet access at hotel lobby . In addition, guests have access to a concierge, a rooftop terrace, and room service. You can also enjoy a pool and free breakfast. Need a place to park? Free parking is available at Basma Hotel. While in Aswan be sure to experience local lobster favorites at 1902 Restaurant. There is no shortage of things to do in the area: explore popular gardens such as Aswan Botanical Garden. Basma Hotel looks forward to welcoming you on your visit to Aswan.",
        "If you are looking for a family-friendly hotel in Aswan, look no further than Happi Hotel. Given the close proximity of popular landmarks, such as El-Tabia Mosque (0.3 mi) and Archangel Michaelâ€™s Coptic Orthodox Cathedral (0.8 mi), guests of Happi Hotel can easily experience some of Aswan's most well known attractions. Happi Hotel offers guests an array of room amenities including air conditioning and a minibar, and getting online is possible, as free wifi is available. The hotel offers a 24 hour front desk, a concierge, and newspaper, to make your visit even more pleasant. While in Aswan be sure to experience local lobster favorites at 1902 Restaurant. If youâ€™re looking for something to do, Temple of Philae (0.8 mi), Nubian Museum (1.0 mi), and Aswan Botanical Garden (0.5 mi) are a nice way to spend some time, and they are all within walking distance of Happi Hotel. The staff at Happi Hotel looks forward to serving you during your upcoming visit.",
        "Looking for a place to stay in Aswan? Then look no further than Pyramisa Isis Corniche Hotel, a family-friendly hotel that brings the best of Aswan to your doorstep. Rooms at Pyramisa Isis Corniche Hotel provide a flat screen TV and air conditioning, and guests can stay connected with free internet access. In addition, while staying at Pyramisa Isis Corniche Hotel guests have access to room service and a concierge. You can also enjoy a pool and free breakfast. Close to some of Aswan's most popular landmarks, such as El-Tabia Mosque (0.4 mi) and Archangel Michaelâ€™s Coptic Orthodox Cathedral (0.7 mi), Pyramisa Isis Corniche Hotel is a great destination for tourists. While in Aswan be sure to experience local lobster favorites at 1902 Restaurant. There is no shortage of things to do in the area: explore popular monuments and statues such as Sound and Light Show - Philae. Weâ€™re sure youâ€™ll enjoy your stay at Pyramisa Isis Corniche Hotel as you experience everything Aswan has to offer.",
        'With river views, Baba Dool is situated in Aswan and has a restaurant and a shared kitchen. The accommodation has a hot tub. A fridge and kettle are also available. Guests at the bed and breakfast can enjoy a Ã\xa0 la carte breakfast.',
        "Looking for a place to stay in Aswan? Then look no further than Marhaba Palace Hotel, a hotel that brings the best of Aswan to your doorstep. Guest rooms offer air conditioning, and Marhaba Palace Hotel makes getting online easy as wifi is available. You can also take advantage of some of the amenities offered by the hotel, including a 24 hour front desk, room service, and a concierge. In addition, guests can enjoy a pool and free breakfast during their visit. As an added convenience, there is street parking available to guests. Given the close proximity of popular landmarks, such as Temple of Philae (1.3 mi) and Archangel Michaelâ€™s Coptic Orthodox Cathedral (1.3 mi), guests of Marhaba Palace Hotel can easily experience some of Aswan's most well known attractions. While in Aswan be sure to experience local shrimp favorites at Chef Khalil. During your visit, be sure to check out popular attractions like Aswan Botanical Garden (0.8 mi), Sehel Island (0.4 mi), and El-Tabia Mosque (0.7 mi), which are all within walking distance of the hotel. Weâ€™re sure youâ€™ll enjoy your stay at Marhaba Palace Hotel as you experience everything Aswan has to offer.",
        'Orchida St. George Hotel overlooks the Nile River, outdoor swimming pool. Free Wi-Fi in all areas. All accommodations at the Orchida St. George Hotel are air-conditioned and offer stunning views of the river. A wardrobe, and the bathroom includes toiletries. Dine in the restaurant that serves dinner 24 hours, also prefer to buy for a fee. There is an apricot terrace surrounding the pool where you can relax. Orchida St. George Hotel offers a 24-hour front desk that can arrange car services, laundry, ironing and dry cleaning services by making it easy. Aswan Airport is a 25-minute drive away, and public parking is available at a location nearby. Couples specifically loved the location, and rated it 8.0 for a two-person trip. We speak your language!',
        "Looking for a place to stay in Aswan? Then look no further than Takela Kato, a budget friendly guest house that brings the best of Aswan to your doorstep. Takela Kato is a budget friendly guest house offering a seating area and extra long beds in the rooms. Given the close proximity of popular landmarks, such as Nubian Village (2.0 mi) and Unfinished Obelisk (2.8 mi), guests of Takela Kato can easily experience some of Aswan's most well known attractions. If you are looking for a good spot to eat nearby, you may want to check out Solaih Nubian Restaurant (1.0 mi), which is within walking distance of Takela Kato. Looking to explore? Then look no further than Sound and Light Show - Philae (0.9 mi), which is a popular Aswan attraction â€“ and it is conveniently located within walking distance of the guest house. Weâ€™re sure youâ€™ll enjoy your stay at Takela Kato as you experience everything Aswan has to offer.",
        'With river views, Baba Dool is situated in Aswan and has a restaurant and a shared kitchen. The accommodation has a hot tub. A fridge and kettle are also available. Guests at the bed and breakfast can enjoy a Ã\xa0 la carte breakfast.',
        "New Abu Simbel Hotel is an excellent choice for travelers visiting Aswan, offering a budget friendly environment alongside many helpful amenities designed to enhance your stay. New Abu Simbel Hotel offers guests an array of room amenities including a flat screen TV, air conditioning, and a refrigerator, and getting online is possible, as public wifi is available. The small hotel offers a concierge, to make your visit even more pleasant. Close to some of Aswan's most popular landmarks, such as El-Tabia Mosque (1.4 mi) and Archangel Michaelâ€™s Coptic Orthodox Cathedral (1.9 mi), New Abu Simbel Hotel is a great destination for tourists. Travelers looking to enjoy some lobster can head to 1902 Restaurant. Otherwise, you may want to check out an Italian restaurant such as Porto Sono. Should time allow, Aswan Botanical Garden and Sehel Island are some popular attractions that are within walking distance. Enjoy your stay in Aswan!",
        '25 km from Aga Khan Mausoleum, Cleopatra Hotel is located in Aswan and offers free WiFi, express check-in and check-out and concierge services. This 3-star hotel offers a business centre and a tour desk.',
        "Citymax Hotel Aswan is centrally located in Aswan City by the Nile river, just steps from the Cornish road. A walking distance to two major historical areas of Aswan city and traditional markets as well shopping malls, the hotel is also a stone's throw away from the historical sites of the old city, Aswan Airport is 15 minutes away. Citymax Hotel Aswan is perfectly located for exploring the city and its natural beauty. Choose from multiple food & beverage options such as City Cafe Restaurant, 24-hour Lavazza coffee shop and the Infantine rooftop Cafe and restaurant overseeing the stunning sunset on Nile River. Each of the 79 guest rooms provides contemporary comforts such as free WiFi and much more. Unwind by our glorious rooftop pool and stay fit with our state-of-the-art gym."
      ];

      var froms = [
        '14:00 PM',
        '13:00 PM',
        '14:00 PM',
        '14:00 PM',
        '14:00 PM',
        '14:00 PM',
        '14:00 PM',
        '14:00 PM',
        '14:00 PM',
        '14:00 PM',
        '14:00 PM',
        '14:00 PM',
        '14:00 PM',
        '14:00 PM',
        '14:00 PM',
        '14:00 PM',
        '14:00 PM',
        '14:00 PM',
        '14:00 PM',
        '14:00 PM',
        '14:00 PM',
        '14:00 PM',
        '14:00 PM',
        '14:00 PM',
        '14:00 PM',
        '14:00 PM'
      ];
      var tos = [
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM',
        '12:00 AM'
      ];
      var images = [
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/51/9a/1c/exterior-view.jpg',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/fe/a5/ed/sofitel-legend-old-cataract.jpg',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/99/ae/d9/photo0jpg.jpg',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/f3/fc/de/upstairs-room-and-deck.jpg?',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/08/d9/4f/photo0jpg.jpg?w=1100&h=-1&s=1',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/08/6e/9d/kato-dool-arial-view.jpg',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/9d/ba/44/photo7jpg.jpg',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/a8/eb/ef/img-20210218-094803-largejpg.jpg',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/73/a9/37/bet-el-kerem.jpg?w=1200&h=-1&s=1',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/96/15/e8/our-kitchen.jpg',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/33/51/8c/arti-ka.jpg?w=800&h=-1&s=1',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/3f/ba/0d/img-20190914-wa0033-largejpg.jpg?w=1200&h=-1&s=1',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-s/03/22/e8/81/marhaba-palace-hotel.jpg?w=600&h=-1&s=1',
        'https://dynamic-media-cdn.tripadvisor.com/media/partner/bookingcom/photo-o/1b/3b/8f/4f/4834493.jpg?w=600&h=-1&s=1',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/46/fe/f2/temple-of-philae.jpg',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/a6/d8/a6/caption.jpg',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/cd/5f/28/view-from-room.jpg',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/63/1c/66/photo5jpg.jpg',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/b9/d4/b1/caption.jpg',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-s/03/22/e8/81/marhaba-palace-hotel.jpg?w=600&h=-1&s=1',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/2b/5a/6f/green-pool-with-floating.jpg',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/2c/45/66/takela-kato.jpg',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/9f/b8/e6/terrace-at-baba-dool.jpg',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-s/01/37/a3/46/abu-simbel.jpg',
        'https://dynamic-media-cdn.tripadvisor.com/media/partner/bookingcom/photo-o/1a/1a/c3/17/facadeentrance.jpg',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/de/79/cc/hotel-location-from-river.jpg'
      ];
      var locations = [
        'Elephantine Island, Aswan 81111 Egypt',
        'Abtal El Tahrir Street, Aswan 81511 Egypt',
        '79 Cornich el Nile, Aswan Egypt',
        'West Bank, Al-Coba, Beside Noble Tombs, Aswan 81527 Egypt',
        'Alnajae Alqabliu, Aswan 81111 Egypt',
        'Nag` Gharb Siheil, Aswan 81511 Egypt',
        'Elephantine Island, Aswan 81111 Egypt',
        'Elfanadek Street, Aswan 81111 Egypt',
        'Nagh El Kuba West Aswan, Aswan Egypt',
        'Aswan 81516 Egypt',
        'Anakato Artika Gharb Soheil, Aswan 81521 Egypt',
        'Saloga Gazal National Park West Bank Aswan, Aswan 81111 Egypt',
        'Corniche El Nil, Aswan Egypt',
        'Street 6, West- Aswan West Bank Governorate, Aswan 00972 Egypt',
        'Sehal Island, Aswan Egypt',
        '1 Al Fanadek Street in front of Nubia Museum, Aswan 81111 Egypt',
        '10 Abtal Al Tahrir, Aswan 81511 Egypt',
        'Corniche El Nile, Aswan Egypt',
        'Elephantine Island, Aswan 81511 Egyp',
        'Corniche El Nil, Aswan Egypt',
        '9 Mohamed Khalid St. Cornish El-Nile, Aswan Egypt',
        'Hessa Island, Aswan 85121 Egypt',
        'Elephantine Island, Aswan 81511 Egypt',
        'Corniche El Nil St., Aswan ',
        'Saad Zaghloul St, Aswan 81511 Egypt',
        'Sheyakhah Thalethah Kornish Al Nile, Aswan 81718 Egypt'
      ];

      var rates = [
        '4.5',
        '4.5',
        '4.5',
        '4.5',
        '4.5',
        '4.5',
        '5.0',
        '5.0',
        '4.5',
        '5.0',
        '4.0',
        '5.0',
        '3.5',
        '2.0',
        '2.0',
        '3.5',
        '3.5',
        '3.5',
        '3.5',
        '3.5',
        '3.0',
        '2.0',
        '3.5',
        '3.0',
        '3.0',
        '3.5'
      ];
      var lats = [
        '24.088934012293045',
        '24.082639252700126',
        '24.08944554698487',
        '24.107317099535464',
        '24.087516026222673',
        '24.060282615863642',
        '24.089676369671896',
        '24.07837211448641',
        '24.10792547911227',
        '24.022097314272294',
        '24.088934012293045',
        '24.07906096591769',
        '24.09964171095965',
        '24.08078001510174',
        '29.95335653479674',
        '26.147076931524612',
        '24.09285364899338',
        '24.092721786256792',
        '24.093430004482716',
        '24.099534089085',
        '24.087681705406844',
        '24.037264853377987',
        '24.092849132204623',
        '24.104929663416673',
        '24.09707952004843',
        '24.097883800664622'
      ];
      var lngs = [
        '32.90000028861506',
        '32.887487304457316',
        '32.89432742724109',
        '32.89327163420888',
        '32.885363649980874',
        '32.86421926571428',
        '32.888737611370736',
        '32.887343656800695',
        '32.904461430395834',
        '32.883119811007376',
        '32.90000028861506',
        '32.87416688856419',
        '32.899799004549465',
        '32.8784094774262',
        '31.45168731876724',
        '32.7423968704611',
        '32.896589295070804',
        '32.89624597232286',
        '32.890941968882906',
        '32.90036584530769',
        '32.894146496822046',
        '32.88265939734209',
        '32.890210870358516',
        '32.90161009919468',
        '32.9004995146189',
        '32.89933587706107'
      ];
      var prices = [
        'EGP 3,057',
        'EGP 3,967',
        'EGP 1,020',
        'EGP 363',
        'EGP 855',
        'EGP 1,051',
        'EGP 682',
        'EGP 1,145',
        'EGP 807',
        'EGP 1,570',
        'EGP 1,155',
        'EGP 863',
        'EGP 912',
        'EGP 420',
        'EGP 551',
        'EEGP 1,318',
        'EGP 398',
        'EGP 1,253',
        'EGP 262',
        'EGP 1,203',
        'EGP 365',
        'EGP 541',
        'EGP 262',
        'Unknown',
        'Unknown',
        'EGP 827'
      ];
      // restaurants
      //     .add(
      //       {
      //         'Name': 'El Dokka',
      //         'Description':
      //             'This large temple complex, relocated to the island of Agilika with the building of the High Dam in Aswan, features the magnificent Temple of Isis that was built in the late Ptolemaic and early Roman periods.',
      //         'Location': 'https://goo.gl/maps/NYPoDTWUb7CazSrR8',
      //         'Rate': 4.0,
      //         'Image':
      //             'https://www.egypttoursportal.com/images/2017/11/Aswan-Nile-Rever-Egypt-Tours-Portal.jpg',
      //         'From': '7:00 AM',
      //         'To': '6:00 PM'
      //       },
      //     )
      //     .then((value) => print("restaurant Added"))
      //     .catchError((error) => print("Failed to add place: $error"));
      for (int i = 0; i < names.length; i++) {
        hotels
            .add(
              {
                'Name': names[i],
                'Description': desc[i],
                'Location': locations[i],
                'Rate': double.parse(rates[i]),
                'Image': images[i],
                'From': froms[i],
                'To': tos[i],
                'Lat': double.parse(lats[i]),
                'Lng': double.parse(lngs[i]),
                'Price': prices[i]
              },
            )
            .then((value) => print("hotel Added"))
            .catchError((error) => print("Failed to add hotel: $error"));
      }
      // temples
      //     .add(
      //       {
      //         'Name': 'Temple of Philae',
      //         'Description':
      //             'This large temple complex, relocated to the island of Agilika with the building of the High Dam in Aswan, features the magnificent Temple of Isis that was built in the late Ptolemaic and early Roman periods.',
      //         'Location': 'https://goo.gl/maps/g9Pcp7LTgc9Mc9FB9',
      //         'Rate': 4.5,
      //         'Image':
      //             'https://www.egypttoursportal.com/images/2017/11/Aswan-Nile-Rever-Egypt-Tours-Portal.jpg',
      //         'From': '7:00 AM',
      //         'To': '6:00 PM'
      //       },
      //     )
      //     .then((value) => print("temple Added"))
      //     .catchError((error) => print("Failed to add place: $error"));
      // places
      //     .add(
      //       {
      //         'Name': 'Aswan High Dam',
      //         'Description':
      //             'Supplying water and electricity to all of Egypt, this impressive two-mile dam was a 1960s feat of engineering.',
      //         'Location': 'https://goo.gl/maps/Eosi21PApj8mhh7r6',
      //         'Rate': 4.4,
      //         'Image':
      //             'https://cdn.britannica.com/34/76234-050-6176AC39/Aswan-High-Dam-Egypt.jpg',
      //         'From': '7:00 AM',
      //         'To': '2:00 PM'
      //       },
      //     )
      //     .then((value) => print("Place Added"))
      //     .catchError((error) => print("Failed to add place: $error"));
    }

    return TextButton(
      onPressed: () {
        addPlace();
        Navigator.pushNamed(context, 'createTour');
      },
      child: Text(
        "Add Places",
      ),
    );
  }
}
