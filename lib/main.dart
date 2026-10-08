import 'package:flutter/material.dart';

void main() {
  runApp(const SparePartsApp());
}

class SparePartsApp extends StatelessWidget {
  const SparePartsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'متجر قطع الغيار',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Tajawal', // تأكد من إضافة الخط في pubspec.yaml إذا أردت استخدامه
      ),
      // دعم اللغة العربية والاتجاه من اليمين إلى اليسار
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة تجريبية لقطع الغيار
    final List<Map<String, String>> parts = [
      {'name': 'فحمات فرامل خلفية', 'price': '150 ر.س', 'category': 'فرامل'},
      {'name': 'فيلتر زيت أصلي', 'price': '45 ر.س', 'category': 'فلاتر'},
      {'name': 'بواجي (طقم 4 حبات)', 'price': '120 ر.س', 'category': 'كهرباء'},
      {'name': 'مساعدات أمامية', 'price': '350 ر.س', 'category': 'مساعدات'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('متجر Klencod لقطع الغيار'),
        backgroundColor: Colors.blueGrey[900],
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // شريط البحث
            TextField(
              decoration: InputDecoration(
                hintText: 'ابحث عن قطعة الغيار أو رقم القطعة...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 20),

            // عنوان التصنيفات
            const Text(
              'التصنيفات الرئيسية',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // قائمة التصنيفات الأفقية
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryChip(label: 'الكل', isSelected: true),
                  CategoryChip(label: 'فرامل'),
                  CategoryChip(label: 'فلاتر'),
                  CategoryChip(label: 'كهرباء'),
                  CategoryChip(label: 'محركات'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // عنوان المنتجات
            const Text(
              'القطع المتاحة',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // شبكة عرض قطع الغيار
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: parts.length,
                itemBuilder: (context, index) {
                  final item = parts[index];
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // أيقونة تعبيرية كبديل للصورة
                          Container(
                            height: 80,
                            width: double.infinity,
                            color: Colors.grey[200],
                            child: const Icon(Icons.build, size: 40, color: Colors.blueGrey),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['name']!,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            item['category']!,
                            style: TextStyle(color: Colors.grey[600], fontSize: 12),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.between,
                            children: [
                              Text(
                                item['price']!,
                                style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_shopping_cart, color: Colors.blueGrey),
                                onPressed: () {},
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ويدجت مخصصة لأزرار التصنيفات
class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const CategoryChip({
    super.key,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        selectedColor: Colors.blueGrey[900],
        textColor: isSelected ? Colors.white : Colors.black,
        onSelected: (bool selected) {},
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(const SparePartsApp());
}

class SparePartsApp extends StatelessWidget {
  const SparePartsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'متجر قطع الغيار',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Tajawal', // تأكد من إضافة الخط في pubspec.yaml إذا أردت استخدامه
      ),
      // دعم اللغة العربية والاتجاه من اليمين إلى اليسار
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة تجريبية لقطع الغيار
    final List<Map<String, String>> parts = [
      {'name': 'فحمات فرامل خلفية', 'price': '150 ر.س', 'category': 'فرامل'},
      {'name': 'فيلتر زيت أصلي', 'price': '45 ر.س', 'category': 'فلاتر'},
      {'name': 'بواجي (طقم 4 حبات)', 'price': '120 ر.س', 'category': 'كهرباء'},
      {'name': 'مساعدات أمامية', 'price': '350 ر.س', 'category': 'مساعدات'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('متجر Klencod لقطع الغيار'),
        backgroundColor: Colors.blueGrey[900],
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // شريط البحث
            TextField(
              decoration: InputDecoration(
                hintText: 'ابحث عن قطعة الغيار أو رقم القطعة...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 20),

            // عنوان التصنيفات
            const Text(
              'التصنيفات الرئيسية',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // قائمة التصنيفات الأفقية
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryChip(label: 'الكل', isSelected: true),
                  CategoryChip(label: 'فرامل'),
                  CategoryChip(label: 'فلاتر'),
                  CategoryChip(label: 'كهرباء'),
                  CategoryChip(label: 'محركات'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // عنوان المنتجات
            const Text(
              'القطع المتاحة',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // شبكة عرض قطع الغيار
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: parts.length,
                itemBuilder: (context, index) {
                  final item = parts[index];
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // أيقونة تعبيرية كبديل للصورة
                          Container(
                            height: 80,
                            width: double.infinity,
                            color: Colors.grey[200],
                            child: const Icon(Icons.build, size: 40, color: Colors.blueGrey),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['name']!,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            item['category']!,
                            style: TextStyle(color: Colors.grey[600], fontSize: 12),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.between,
                            children: [
                              Text(
                                item['price']!,
                                style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_shopping_cart, color: Colors.blueGrey),
                                onPressed: () {},
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ويدجت مخصصة لأزرار التصنيفات
class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const CategoryChip({
    super.key,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        selectedColor: Colors.blueGrey[900],
        textColor: isSelected ? Colors.white : Colors.black,
        onSelected: (bool selected) {},
      ),
    );
  }
}