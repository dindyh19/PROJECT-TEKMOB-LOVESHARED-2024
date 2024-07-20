import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(BookApp());

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOVEShared.',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        elevation: 5.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.book, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  'LOVEShared.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryScreen()),
                );
              },
              child: Text('Category'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.yellow.shade700,
              ),
            ),
          ],
        ),
      ),
      body: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                // Implement search functionality if needed
              },
              decoration: InputDecoration(
                labelText: 'Search Items',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recommendation Items',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(),
          _buildRecommendationSection(context),
        ],
      ),
    );
  }

  Widget _buildRecommendationSection(BuildContext context) {
    List<Map<String, String?>> recommendations = [
      {
        'title': 'Novel',
        'image':
            'https://down-id.img.susercontent.com/file/sg-11134201-22110-7s59ldcniyjv29',
        'shopeeLink':
            'https://shopee.co.id/BUKU-ART-OF-HEALING-binararutala-BUKU-BAKLU-i.518426953.12897379765',
      },
      {
        'title': 'Literasi',
        'image':
            'https://down-id.img.susercontent.com/file/444903eca2e72c6edd86450d6dfc78da',
        'shopeeLink':
            'https://shopee.co.id/BUKU-HTML-5-(-Dasar-dasar-pengembangan-aplikasi-berbasis-web)-i.676182118.14349366636',
      },
      {
        'title': 'Komik',
        'image':
            'https://down-id.img.susercontent.com/file/f21ebbbdf134dadbacb0ce530f1d718d',
        'shopeeLink':
            'https://shopee.co.id/Komik-Real-Masjid-Komplet-kompilasi-seri-1-2-3-4-i.43794286.1198079240',
      },
      {
        'title': 'Dongeng Anak',
        'image':
            'https://down-id.img.susercontent.com/file/sg-11134201-7rd3k-lukghbyyw64x71',
        'shopeeLink':
            'https://shopee.co.id/Buku-Dongeng-Dino-Sebelum-Tidur-(Faza)-i.63842097.25776781657',
      },
      {
        'title': 'Karya Ilmiah',
        'image':
            'https://down-id.img.susercontent.com/file/b2773e3519cbc113ced11eb1a59f248c',
        'shopeeLink':
            'https://shopee.co.id/Buku-Dongeng-Dino-Sebelum-Tidur-(Faza)-i.63842097.25776781657',
      },
    ];

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: recommendations
              .map((bookInfo) => _buildBookItem(bookInfo, context))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildBookItem(Map<String, String?> bookInfo, BuildContext context) {
    String bookTitle = bookInfo['title'] ?? "";
    String imageUrl = bookInfo['image'] ?? "";
    String shopeeLink = bookInfo['shopeeLink'] ?? "";

    return GestureDetector(
      onTap: () {
        _launchURL(shopeeLink);
      },
      child: Container(
        width: 100,
        height: 150,
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Center(child: Text('Gambar tidak tersedia')),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              color: Colors.blue,
              width: double.infinity,
              child: Text(
                bookTitle,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class CategoryScreen extends StatelessWidget {
  final List<Map<String, String?>> categories = [
    {
      'title': 'Novel',
      'image': 'https://example.com/image1.jpg',
      'shopeeLink': 'https://example.com/shopee1',
    },
    {
      'title': 'Literasi',
      'image': 'https://example.com/image2.jpg',
      'shopeeLink': 'https://example.com/shopee2',
    },
    {
      'title': 'Komik',
      'image': 'https://example.com/image3.jpg',
      'shopeeLink': 'https://example.com/shopee3',
    },
    {
      'title': 'Dongeng Anak',
      'image': 'https://example.com/image3.jpg',
      'shopeeLink': 'https://example.com/shopee3',
    },
    {
      'title': 'Karya Ilmiah',
      'image': 'https://example.com/image3.jpg',
      'shopeeLink': 'https://example.com/shopee3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            for (Map<String, String?> category in categories)
              _buildCategorySection(category, context),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(
      Map<String, String?> category, BuildContext context) {
    String categoryTitle = category['title'] ?? "";
    List<Map<String, String?>> books = [];

    // Populate the books list based on the category title
    switch (categoryTitle) {
      case 'Novel':
        books = [
          {
            'title': 'Novel 1',
            'image':
                'https://down-id.img.susercontent.com/file/sg-11134201-22110-7s59ldcniyjv29',
            'shopeeLink':
                'https://shopee.co.id/BUKU-ART-OF-HEALING-binararutala-BUKU-BAKLU-i.518426953.12897379765',
          },
          {
            'title': 'Novel 2',
            'image':
                'https://down-id.img.susercontent.com/file/sg-11134201-7rd3z-lx83xmnsgx6186',
            'shopeeLink':
                'https://shopee.co.id/Novel-Meluruhkan-Pilu-Aku-Jatuh-Cinta-dengan-Ketidakmungkinan-Kita-(Dyssa-Chrysilla-Cathlin)-i.63842097.24032986002',
          },
          {
            'title': 'Novel 3',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r98s-lx6viezhizvie5',
            'shopeeLink':
                'https://shopee.co.id/Novel-Aku-Kalah-Aku-Berdamai-(Raga-Ayesha)-i.131927764.20205439547',
          },
          {
            'title': 'novel 4',
            'image':
                'https://down-id.img.susercontent.com/file/sg-11134201-7rd58-lw58qayeegeb1b',
            'shopeeLink':
                'https://shopee.co.id/Buku-Nak-Kamu-Gapapa-Kan-(Mas-Koko-Ganteng)-i.63842097.28951792149?publish_id=&sp_atk=44663590-ff47-4575-8c5e-4957edf92587&xptdk=44663590-ff47-4575-8c5e-4957edf92587'
          },
          {
            'title': 'novel 5',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7qul0-ljw9684bsu22bd',
            'shopeeLink':
                'https://shopee.co.id/Buku-Overthinking-Is-My-Hobby-and-I-Hate-It-FREE-BONUS-i.254959171.23847956698?publish_id=&sp_atk=dc381229-35c3-47a9-8f5e-4a42f5351f41&xptdk=dc381229-35c3-47a9-8f5e-4a42f5351f41'
          },
          {
            'title': 'novel 6',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r98w-lrdvihkty9h900',
            'shopeeLink':
                'https://shopee.co.id/Buku-Novel-Teruntuk-Masa-Kecil-Dan-Aku-Di-Kemudian-Hari-Rofie-Fauzie-Gagas-Media-i.254959171.25662456719?publish_id=&sp_atk=6628311a-db3a-406b-921c-d8732bcb3887&xptdk=6628311a-db3a-406b-921c-d8732bcb3887'
          },
          {
            'title': 'novel 7',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r98s-lspdccxsztis28',
            'shopeeLink':
                'https://shopee.co.id/Buku-My-Home-My-Self-(C-Klik-Media)-i.7186110.24217894613?publish_id=&sp_atk=8e712434-72be-4c90-a5a4-c198d7a7c368&xptdk=8e712434-72be-4c90-a5a4-c198d7a7c368'
          },
          {
            'title': 'novel 8',
            'image':
                'https://down-id.img.susercontent.com/file/sg-11134201-7rd60-lx842vem5ap2e3',
            'shopeeLink':
                'https://shopee.co.id/Buku-Atur-Saja-Bagaimana-Baiknya-Ya-Rabb!-(Ilham-Afriansyah)-(Ilham-Afriansyah)-i.63842097.25682981216?publish_id=&sp_atk=c3813b76-6414-4e0c-89b8-e2c0eddd993c&xptdk=c3813b76-6414-4e0c-89b8-e2c0eddd993c'
          },
          {
            'title': 'novel 9',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r990-ls0vvx1tsj0p9a',
            'shopeeLink':
                'https://shopee.co.id/Buku-Tenang-A-Book-That-Can-Hold-You-Tight-(C-Klik-Media)-i.7186110.20687374309?publish_id=&sp_atk=97b9c03b-6f57-4f47-bb1a-20fbd463f2ee&xptdk=97b9c03b-6f57-4f47-bb1a-20fbd463f2ee'
          },
          {
            'title': 'novel 10',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r98x-loatws7fpr7naa',
            'shopeeLink':
                'https://shopee.co.id/Buku-Melelahkan-Tapi-Harus-Diperjuangkan-(C-Klik-Media)-i.7186110.23161217580?publish_id=&sp_atk=e833614d-4207-4916-9070-e9655892fc48&xptdk=e833614d-4207-4916-9070-e9655892fc48'
          },
        ];
        break;
      case 'Literasi':
        books = [
          {
            'title': 'Literasi 1',
            'image':
                'https://down-id.img.susercontent.com/file/444903eca2e72c6edd86450d6dfc78da',
            'shopeeLink':
                'https://shopee.co.id/BUKU-HTML-5-(-Dasar-dasar-pengembangan-aplikasi-berbasis-web)-i.676182118.14349366636',
          },
          {
            'title': 'literasi 2',
            'image':
                'https://down-id.img.susercontent.com/file/71742871f6ff78dd1467a4334ece0727', // Ganti dengan URL gambar yang valid
            'shopeeLink':
                'https://shopee.co.id/-termurah-7-in-1-pemrograman-web-untuk-pemula-(cara-cepat-dan-efektif-menjadi-web-programmer)-i.22618520.15745973874?sp_atk=b408ce22-9a47-4a54-855a-d39521d3285c&xptdk=b408ce22-9a47-4a54-855a-d39521d3285c', // Ganti dengan URL Shopee yang valid
          },
          {
            'title': 'literasi 3',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r98o-lxngl89rhklp08', // Ganti dengan URL gambar yang valid
            'shopeeLink':
                'https://shopee.co.id/BUKU-DATA-SCIENCE-DENGAN-PYTHON-KONSEP-DAN-IMPLEMENTASI-(-TERBARU)-i.22618520.29905219561?publish_id=&sp_atk=76605fc7-8db9-4604-85d6-78e73c0ce6b2&xptdk=76605fc7-8db9-4604-85d6-78e73c0ce6b2', // Ganti dengan URL Shopee yang valid
          },
          {
            'title': 'literasi 4',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r990-ltotu2o1oex153', // Ganti dengan URL gambar yang valid
            'shopeeLink':
                'https://shopee.co.id/BUKU-KURSUS-MANDIRI-PYTHON-(MENJADI-PROGRAMER-PYTHON-DALAM-5-TAHAP)-i.22618520.24372417370?publish_id=&sp_atk=21dbf7fc-364f-486b-a656-1114462f17d4&xptdk=21dbf7fc-364f-486b-a656-1114462f17d4', // Ganti dengan URL Shopee yang valid
          },
          {
            'title': 'literasi 5',
            'image':
                'https://down-id.img.susercontent.com/file/e0dd5646d6a757c9ad2f69bd41ddafbf', // Ganti dengan URL gambar yang valid
            'shopeeLink':
                'https://shopee.co.id/PROMO-Buku-Analisa-dan-Perancangan-Sistem-Informasi-BUKU-ORIGINAL-i.159912873.9515244213?publish_id=&sp_atk=bedd410b-7f66-4bf9-8d1c-3ca12ac4ff85&xptdk=bedd410b-7f66-4bf9-8d1c-3ca12ac4ff85', // Ganti dengan URL Shopee yang valid
          },
          {
            'title': 'literasi 6',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134201-7r98s-lrihykaha25q31', // Ganti dengan URL gambar yang valid
            'shopeeLink':
                'https://shopee.co.id/Belajar-Pemrograman-Web-Untuk-Pemula-Bahas-Tuntas-Pemrogra-i.63842097.24363041194?publish_id=&sp_atk=86082513-1d98-4304-a6bf-cd92a363e279&xptdk=86082513-1d98-4304-a6bf-cd92a363e279', // Ganti dengan URL Shopee yang valid
          },
          {
            'title': 'literasi 7',
            'image':
                'https://down-id.img.susercontent.com/file/4b015c340856bd1a17fd57b7f5a64502', // Ganti dengan URL gambar yang valid
            'shopeeLink':
                'https://shopee.co.id/BUKU-PEMROGRAMAN-WEB-DISERTAI-STUDI-KASUS-WEB-SISTEM-INFORMASI-AKADEMIK-PRIYANTO-HIDAYATULLAH-i.46061626.9795643193?publish_id=&sp_atk=86e1d9ed-abd6-4da3-b15f-bcdfa04d4e9f&xptdk=86e1d9ed-abd6-4da3-b15f-bcdfa04d4e9f', // Ganti dengan URL Shopee yang valid
          },
          {
            'title': 'literasi 8',
            'image':
                'https://down-id.img.susercontent.com/file/d877c5d3442d24f69162e8cfcd69506b', // Ganti dengan URL gambar yang valid
            'shopeeLink':
                'https://shopee.co.id/BUKU-PEMROGRAMAN-C-DAN-C-REVISI-2-ADAM-MUKHARIL-BACHTIAR-HARGA-MAHASISWA-i.46061626.829224991?publish_id=&sp_atk=26c8f4c9-526f-499e-b40c-a8f925b3c52e&xptdk=26c8f4c9-526f-499e-b40c-a8f925b3c52e', // Ganti dengan URL Shopee yang valid
          },
          {
            'title': 'literasi 9',
            'image':
                'https://down-id.img.susercontent.com/file/5caf4d7f1f1c2396fdf93a9d77d69b6b', // Ganti dengan URL gambar yang valid
            'shopeeLink':
                'https://shopee.co.id/-termurah-Analisis-perancangan-sistem-berorientasi-objek-dengan-UML-edisi2-i.22618520.15400848845?sp_atk=a25527c9-a641-4836-b090-c569b7739e40&xptdk=a25527c9-a641-4836-b090-c569b7739e40', // Ganti dengan URL Shopee yang valid
          },
          {
            'title': 'literasi 10',
            'image':
                'https://down-id.img.susercontent.com/file/44bcd136a591f7f622b8a5a724ab2eb2', // Ganti dengan URL gambar yang valid
            'shopeeLink':
                'https://shopee.co.id/-Termurah-Buku-Manajemen-Pengembangan-Sumberdaya-Manusia-Konsep-konsep-Kunci-i.22618520.14146457957?sp_atk=db788a87-bd33-41b8-8b0d-fd70bec815b3&xptdk=db788a87-bd33-41b8-8b0d-fd70bec815b3', // Ganti dengan URL Shopee yang valid
          },
          {
            'title': 'literasi 11',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r990-lsn45yozfscp22', // Ganti dengan URL gambar yang valid
            'shopeeLink':
                'https://shopee.co.id/Source-Code-Web-Portal-Sekolah-V3-berbasis-Ci-4-i.76540043.22921222066?sp_atk=aa99c51c-6fd4-4a2f-acdf-cf8997cde03c&xptdk=aa99c51c-6fd4-4a2f-acdf-cf8997cde03c', // Ganti dengan URL Shopee yang valid
          },
          {
            'title': 'literasi 12',
            'image':
                'https://down-id.img.susercontent.com/file/3da08dba3063531181d6cd3e71f1bf1a', // Ganti dengan URL gambar yang valid
            'shopeeLink':
                'https://shopee.co.id/-Termurah-Buku-java-di-web-i.22618520.4378503496?sp_atk=86ab92ed-a8d2-481d-962f-9351729572e7&xptdk=86ab92ed-a8d2-481d-962f-9351729572e7', // Ganti dengan URL Shopee yang valid
          },
        ];
        break;
      case 'Komik':
        books = [
          {
            'title': 'Komik 1',
            'image':
                'https://down-id.img.susercontent.com/file/f21ebbbdf134dadbacb0ce530f1d718d',
            'shopeeLink':
                'https://shopee.co.id/Komik-Real-Masjid-Komplet-kompilasi-seri-1-2-3-4-i.43794286.1198079240',
          },
          {
            'title': 'komik 2',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r98y-lwbctwl49j56b8', // Ganti dengan URL gambar yang valid
            'shopeeLink':
                'https://shopee.co.id/Komik-Manga-Sakamoto-Days-Vol.-1-16-by-Yuto-Suzuki-Bahasa-Indonesia-i.341014925.26802234752?sp_atk=b9492102-a42e-419c-9a3b-ddf8c9083490&xptdk=b9492102-a42e-419c-9a3b-ddf8c9083490', // Ganti dengan URL Shopee yang valid
          },
          {
            'title': 'komik 3',
            'image':
                'https://down-id.img.susercontent.com/file/sg-11134201-7rd6r-lx160k5ks22u1c', // Ganti dengan URL gambar yang valid
            'shopeeLink':
                'https://shopee.co.id/Komik-Naruto-Side-Story-Seventh-Hokage-and-The-Scarlet-Spring-(2024)-i.63842097.27953893320?sp_atk=404b4adb-5540-4281-a286-09de931499c5&xptdk=404b4adb-5540-4281-a286-09de931499c5', // Ganti dengan URL Shopee yang valid
          },
          {
            'title': 'komik 4',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r98w-lwtucg74nw324f', // Ganti dengan URL gambar yang valid
            'shopeeLink':
                'https://shopee.co.id/Komik-Elektrichka-(Book-One)-i.104770811.28200187183?sp_atk=4488d9fa-5b12-416d-b528-2b48641c1af9&xptdk=4488d9fa-5b12-416d-b528-2b48641c1af9', // Ganti dengan URL Shopee yang valid
          },
          {
            'title': 'komik 5',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r98o-lvfo8u4sjlvsae', // Ganti dengan URL gambar yang valid
            'shopeeLink':
                'https://shopee.co.id/Komik-Detektif-Conan-104-(Aoyama-Gosho)-i.63842097.29950285091?sp_atk=28d03201-53c5-45d0-86a9-8c9246acd078&xptdk=28d03201-53c5-45d0-86a9-8c9246acd078', // Ganti dengan URL Shopee yang valid
          },
          {
            'title': 'komik 6',
            'image':
                'https://down-id.img.susercontent.com/file/f21ebbbdf134dadbacb0ce530f1d718d', // Ganti dengan URL gambar yang valid
            'shopeeLink':
                'https://shopee.co.id/Komik-Real-Masjid-Komplet-kompilasi-seri-1-2-3-4-i.43794286.1198079240?sp_atk=f861beba-249e-438e-8ea0-0be5bf84eae0&xptdk=f861beba-249e-438e-8ea0-0be5bf84eae0', // Ganti dengan URL Shopee yang valid
          },
          {
            'title': 'komik 7',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r98t-lwbbdzf9k3ho4b', // Ganti dengan URL gambar yang valid
            'shopeeLink':
                'https://shopee.co.id/Komik-Manga-Jujutsu-Kaisen-Vol.-1-26-by-Gege-Akutami-Bahasa-Indonesia-i.341014925.29052234925?sp_atk=3cea2359-1cac-4460-8060-d9db098386c2&xptdk=3cea2359-1cac-4460-8060-d9db098386c2', // Ganti dengan URL Shopee yang valid
          },
          {
            'title': 'komik 8',
            'image':
                'https://down-id.img.susercontent.com/file/sg-11134201-7rd41-lw9im1jfw2x4c9', // Ganti dengan URL gambar yang valid
            'shopeeLink':
                'https://shopee.co.id/Komik-L-Change-The-World-(written-by-M)-Shueisha-i.63842097.28902120849?sp_atk=287a8533-274b-4f8d-b787-b76638d1b7e1&xptdk=287a8533-274b-4f8d-b787-b76638d1b7e1', // Ganti dengan URL Shopee yang valid
          },
          {
            'title': 'komik 9',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r990-lodi2utc6byf5a', // Ganti dengan URL gambar yang valid
            'shopeeLink':
                'https://shopee.co.id/SI-JUKI-KISAH-KUSUT-DUNIA-DONGENG-01-DAN-02-FAZA-MEONK-i.17966930.7623860595?sp_atk=910c057b-fd89-49e4-b7a8-d8275c2e514f&xptdk=910c057b-fd89-49e4-b7a8-d8275c2e514f3', // Ganti dengan URL Shopee yang valid
          },
          {
            'title': 'komik 10',
            'image':
                'https://down-id.img.susercontent.com/file/sg-11134201-7rd59-lwy0w16i5axr96', // Ganti dengan URL gambar yang valid
            'shopeeLink':
                'https://shopee.co.id/Komik-Pengen-Jadi-Baik-Ready-Jilid-1-10-Original-WAKE-UP-EARLY-i.285331653.29803686535?sp_atk=3fc4501e-85a3-4c86-8623-f6192d04e20c&xptdk=3fc4501e-85a3-4c86-8623-f6192d04e20c', // Ganti dengan URL Shopee yang valid
          },
          {
            'title': 'komik 11',
            'image':
                'https://down-id.img.susercontent.com/file/sg-11134201-7rd45-lvob1kc6024fa4', // Ganti dengan URL gambar yang valid
            'shopeeLink':
                'https://shopee.co.id/Komik-Dandadan-Volume-1-7-By-Yukinobu-Tatsu-(-English-)-i.786164505.27150824296?sp_atk=5e9b3832-716a-4321-bec6-67819ed524ce&xptdk=5e9b3832-716a-4321-bec6-67819ed524ce', // Ganti dengan URL Shopee yang valid
          },
        ];
        break;
      case 'Dongeng Anak':
        books = [
          {
            'title': 'Dongeng 1',
            'image':
                'https://down-id.img.susercontent.com/file/sg-11134201-7rd3k-lukghbyyw64x71',
            'shopeeLink':
                'https://shopee.co.id/Buku-Dongeng-Dino-Sebelum-Tidur-(Faza)-i.63842097.25776781657',
          },
          {
            'title': 'Dongeng Anak 2',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r98r-luczkcp8se8639', // Ganti dengan URL gambar yang valid
          },
          {
            'title': 'Dongeng Anak 3',
            'image':
                'https://down-id.img.susercontent.com/file/6b609b2270ad1731b5ab373f53b7aaf8', // Ganti dengan URL gambar yang valid
          },
          {
            'title': 'Dongeng Anak 4',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r98x-lui2kixb2kcq9a', // Ganti dengan URL gambar yang valid
          },
          {
            'title': 'Dongeng Anak 5',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r98y-luin77wip9z019', // Ganti dengan URL gambar yang valid
          },
          {
            'title': 'Dongeng Anak 6',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r98w-luin77wip9y5bf', // Ganti dengan URL gambar yang valid
          },
          {
            'title': 'Dongeng Anak 7',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r991-luin77wipa1z07', // Ganti dengan URL gambar yang valid
          },
          {
            'title': 'Dongeng Anak 8',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r98u-luin77wipagk8c', // Ganti dengan URL gambar yang valid
          },
          {
            'title': 'Dongeng Anak 9',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r991-luin77wipa1z07', // Ganti dengan URL gambar yang valid
          },
          {
            'title': 'Dongeng Anak 10',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r98u-luin77wsovkg1e', // Ganti dengan URL gambar yang valid
          },
        ];
        break;
      case 'Karya Ilmiah':
        books = [
          {
            'title': 'Karya 1',
            'image':
                'https://down-id.img.susercontent.com/file/b2773e3519cbc113ced11eb1a59f248c',
            'shopeeLink':
                'https://shopee.co.id/Buku-Pemrograman-Bahasa-C-Jilid-1-(Suswanto)-i.27619008.2140461828',
          },
          {
            'title': 'karya ilmiah 2',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r98s-low74qakwuxf30', // Ganti dengan URL gambar yang valid
          },
          {
            'title': 'karya ilmiah 3',
            'image':
                'https://down-id.img.susercontent.com/file/a54e3d7823dcd90cdf2927a85f3323ff', // Ganti dengan URL gambar yang valid
          },
          {
            'title': 'karya ilmiah 4',
            'image':
                'https://down-id.img.susercontent.com/file/dc37a294f1cdcd0dcbe2c710b93c4184', // Ganti dengan URL gambar yang valid
          },
          {
            'title': 'karya ilmiah 5',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-23020-y4gccewby3nve3', // Ganti dengan URL gambar yang valid
          },
          {
            'title': 'karya ilmiah 6',
            'image':
                'https://down-id.img.susercontent.com/file/d44205facd7c7cafb62fdac3b47c71d8', // Ganti dengan URL gambar yang valid
          },
          {
            'title': 'karya ilmiah 7',
            'image':
                'https://down-id.img.susercontent.com/file/dfa2d6abc9cb813ff3bf9c3d71bae9d1', // Ganti dengan URL gambar yang valid
          },
          {
            'title': 'karya ilmiah 8',
            'image':
                'https://down-id.img.susercontent.com/file/7bff73b6430e41853c33635d607a53a6', // Ganti dengan URL gambar yang valid
          },
          {
            'title': 'karya ilmiah 9',
            'image':
                'https://down-id.img.susercontent.com/file/id-11134207-7r992-luydfbrmn368cb', // Ganti dengan URL gambar yang valid
          },
          {
            'title': 'karya ilmiah 10',
            'image':
                'https://down-id.img.susercontent.com/file/13136198119acc1335b4562215894be5', // Ganti dengan URL gambar yang valid
          },
        ];
        break;
      default:
        books = [];
    }

    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          color: Colors.grey[300],
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            categoryTitle,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: books
              .map((bookInfo) => _buildBookItem(bookInfo, context))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildBookItem(Map<String, String?> bookInfo, BuildContext context) {
    String bookTitle = bookInfo['title'] ?? "";
    String imageUrl = bookInfo['image'] ?? "";
    String shopeeLink = bookInfo['shopeeLink'] ?? "";

    return GestureDetector(
      onTap: () {
        _launchURL(shopeeLink);
      },
      child: Container(
        width: 100,
        height: 150,
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Center(child: Text('Gambar tidak tersedia')),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              color: Colors.blue,
              width: double.infinity,
              child: Text(
                bookTitle,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
