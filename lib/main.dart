import 'package:flutter/material.dart';

/* =========================
   GLOBAL CART STATE
========================= */
final ValueNotifier<List<Map<String, dynamic>>> cart =
    ValueNotifier<List<Map<String, dynamic>>>([]);

void main() {
  runApp(const TokoApp());
}

class TokoApp extends StatelessWidget {
  const TokoApp({super.key});
  static const shopeeRed = Color(0xFFEE4D2D);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopee Style',
      theme: ThemeData(
        primaryColor: shopeeRed,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: const MainPage(),
    );
  }
}

/* =========================
   MAIN PAGE + BOTTOM NAV
========================= */
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  final pages = const [
    HomePage(),
    Center(child: Text("Shopee Mall")),
    CartPage(),
    Center(child: Text("Notifikasi")),
    Center(child: Text("Profil")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: TokoApp.shopeeRed,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Mall"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Keranjang"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notif"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}

/* =========================
   HOME PAGE + SEARCH
========================= */
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const shopeeRed = Color(0xFFEE4D2D);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final allProducts = const [
    {
      "name": "Sepatu Sneakers",
      "price": "Rp250.000",
      "image": "assets/images/sepatu.jpg",
      "rating": "4.8",
      "sold": "1RB"
    },
    {
      "name": "Kaos Polos",
      "price": "Rp75.000",
      "image": "assets/images/baju.jpg",
      "rating": "4.5",
      "sold": "500"
    },
    {
      "name": "Tas Ransel",
      "price": "Rp180.000",
      "image": "assets/images/tas.jpg",
      "rating": "4.7",
      "sold": "750"
    },
    {
      "name": "Jam Tangan",
      "price": "Rp320.000",
      "image": "assets/images/jam.jpg",
      "rating": "4.9",
      "sold": "1.2RB"
    },
  ];

  List<Map<String, dynamic>> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = allProducts;
  }

  void _filterProducts(String query) {
    final lower = query.toLowerCase();
    setState(() {
      filteredProducts = allProducts
          .where((p) => p["name"]!.toLowerCase().contains(lower))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HomePage.shopeeRed,
        title: TextField(
          onChanged: _filterProducts,
          decoration: InputDecoration(
            hintText: "Cari di Shopee",
            fillColor: Colors.white,
            filled: true,
            prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 18),
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _banner(),
            _menuFitur(),
            _gridProduk(context),
          ],
        ),
      ),
    );
  }

  Widget _banner() {
    return Container(
      height: 110,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [HomePage.shopeeRed, Color(0xFFFF7337)],
        ),
      ),
      alignment: Alignment.center,
      child: const Text(
        "🔥 GRATIS ONGKIR & FLASH SALE!",
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _menuFitur() {
    final menus = [
      Icons.local_shipping,
      Icons.flash_on,
      Icons.phone_android,
      Icons.receipt_long,
      Icons.card_giftcard,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: menus
            .map((icon) => CircleAvatar(
                  radius: 22,
                  backgroundColor: HomePage.shopeeRed.withOpacity(0.1),
                  child: Icon(icon, color: HomePage.shopeeRed, size: 20),
                ))
            .toList(),
      ),
    );
  }

  Widget _gridProduk(BuildContext context) {
    int cross = MediaQuery.of(context).size.width >= 800 ? 4 : 2;

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: cross,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.62,
      ),
      itemBuilder: (context, i) {
        final p = filteredProducts[i];
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  p["image"]!,
                  height: 135,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(p["name"]!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(p["price"]!,
                    style: const TextStyle(
                        color: HomePage.shopeeRed,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    const SizedBox(width: 2),
                    Text(p["rating"]!, style: const TextStyle(fontSize: 12)),
                    const SizedBox(width: 6),
                    Text("• Terjual ${p["sold"]}", style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: HomePage.shopeeRed,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailPage(product: p),
                            ),
                          );
                        },
                        child: const Text("Beli", style: TextStyle(fontSize: 12)),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: HomePage.shopeeRed),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                        onPressed: () {
                          cart.value = [...cart.value, p];
                        },
                        child: const Icon(Icons.shopping_cart,
                            size: 18, color: HomePage.shopeeRed),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

/* =========================
   DETAIL PAGE
========================= */
class DetailPage extends StatelessWidget {
  final Map<String, dynamic> product;
  static const shopeeRed = Color(0xFFEE4D2D);

  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: shopeeRed,
          title: Text(product["name"]!, style: const TextStyle(fontSize: 16))),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: shopeeRed)),
                onPressed: () {
                  cart.value = [...cart.value, product];
                },
                child: const Icon(Icons.shopping_cart, color: shopeeRed),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 3,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: shopeeRed),
                onPressed: () {
                  cart.value = [...cart.value, product];
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CartPage()),
                  );
                },
                child:
                    const Text("Beli Sekarang", style: TextStyle(fontSize: 14)),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product["image"]!,
                height: 240, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product["price"]!,
                      style: const TextStyle(
                          color: shopeeRed,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(product["rating"] ?? "4.8",
                          style: const TextStyle(fontSize: 12)),
                      const SizedBox(width: 6),
                      Text("• Terjual ${product["sold"] ?? "1RB"}",
                          style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text("Deskripsi Produk",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  const Text(
                    "Produk berkualitas tinggi, nyaman digunakan dan cocok untuk kebutuhan harian.",
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/* =========================
   CART PAGE
========================= */
class CartPage extends StatelessWidget {
  static const shopeeRed = Color(0xFFEE4D2D);
  const CartPage({super.key});

  int total(List<Map<String, dynamic>> items) {
    return items.fold(
        0,
        (sum, e) =>
            sum +
            int.parse(e["price"]!.replaceAll("Rp", "").replaceAll(".", "")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: shopeeRed, title: const Text("Keranjang")),
      body: ValueListenableBuilder(
        valueListenable: cart,
        builder: (_, items, __) {
          if (items.isEmpty) {
            return const Center(child: Text("Keranjang kosong"));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (_, i) {
                    final p = items[i];
                    return ListTile(
                      leading: Image.asset(p["image"]!, width: 46),
                      title:
                          Text(p["name"]!, style: const TextStyle(fontSize: 14)),
                      subtitle: Text(p["price"]!,
                          style: const TextStyle(color: shopeeRed)),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          final newCart = [...items];
                          newCart.removeAt(i);
                          cart.value = newCart;
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total: Rp ${total(items)}",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: shopeeRed),
                      onPressed: () {},
                      child: const Text("Checkout"),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
