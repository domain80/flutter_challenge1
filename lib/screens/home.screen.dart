import "dart:ui";

import "package:dc1/widgets/bottom_nav.dart";
import "package:dc1/widgets/home_app_bar.dart";
import "package:dc1/widgets/product_card.dart";
import "package:flutter/material.dart";
import "package:iconsax/iconsax.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = ["All", "Nike", "Adidas", "Converse"];

  int selected = 0;
  double horizontalPadding = 32;

  List<String> shoeImgUrls = [
    "assets/img/shoe1.png",
    "assets/img/shoe1.png",
    "assets/img/shoe2.png",
    "assets/img/shoe3.png",
    "assets/img/shoe4.png",
    "assets/img/shoe2.png",
    "assets/img/shoe3.png",
    "assets/img/shoe2.png",
    "assets/img/shoe3.png",
    "assets/img/shoe4.png",
    "assets/img/shoe2.png",
    "assets/img/shoe3.png",
  ];

  // late ScrollController _controller;

  // late double scrollPercentage;

  @override
  void initState() {
    super.initState();
    // _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: CustomScrollView(
        // controller: _controller,
        slivers: [
          HomeAppBar(
            horizontalPadding: horizontalPadding,
            scrollPercentage: 4.0,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Search",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff0F172A),
                          foregroundColor: const Color(0xffF8FAFC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 16),
                        ),
                        child: const Icon(Iconsax.search_normal),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: categories
                        .asMap()
                        .map(
                          (key, value) {
                            return MapEntry(
                              key,
                              GestureDetector(
                                onTap: () => setState(() {
                                  selected = key;
                                }),
                                // index == selected ? Color(0xff0F172A) :
                                // Color(0xffF8FAFC),
                                child: Chip(
                                  label: Text(value),
                                  labelStyle: TextStyle(
                                    color: key != selected
                                        ? const Color(0xff0F172A)
                                        : const Color(0xffF8FAFC),
                                  ),
                                  backgroundColor: key == selected
                                      ? const Color(0xff0F172A)
                                      : Colors.transparent,
                                ),
                              ),
                            );
                          },
                        )
                        .values
                        .toList(),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: horizontalPadding,
              right: horizontalPadding,
              bottom: 52,
            ),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 28,
                mainAxisExtent: 240,
              ),
              itemCount: shoeImgUrls.length,
              itemBuilder: (context, index) {
                return ProductCard(imageUrl: shoeImgUrls[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
