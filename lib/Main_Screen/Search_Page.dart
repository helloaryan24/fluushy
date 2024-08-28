import 'package:flutter/material.dart';
import 'package:fluushy/All_Custom_Faction/TextStyle.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../Controller/SearchController.dart';

class SearchPage_Screen extends StatelessWidget {
  final Searchcontroller controller = Get.put(Searchcontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.whitecolor,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.contcolor1,
                borderRadius: BorderRadius.circular(8),
              ),
              child: buildInputField(
                hintText: "Search toilets & amenities near you",
                controller: controller.searchController.value,
                keyboardType: TextInputType.name,
                onChanged: (query) {
                  // controller.searchLocation(query);
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text('Recent searches', style: TextStyles.Montserratbold6),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.items.length,
                  itemBuilder: (context, index) {
                    final item = controller.items[index];
                    final screenWidth = MediaQuery.of(context).size.width;
                    final screenHeight = MediaQuery.of(context).size.height;
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed('/Toiletsdetalis_Screen');
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                        decoration: BoxDecoration(
                          color: AppColors.contcolor1.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(screenHeight * 0.01),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: screenWidth < 600 ? 4 : 2,
                                child: Column(
                                  children: [
                                    Image.asset('${item['imageUrl']}'),
                                    SizedBox(height: screenHeight * 0.01),
                                    Container(
                                      height: screenHeight * 0.030,
                                      width: 100,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: AppColors.whitecolor,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: screenHeight * 0.015,
                                          ),
                                          Text(
                                            '${item['rating']} (${item['reviews']} reviews)',
                                            style:
                                                TextStyles.MontserratRegular1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.01),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _buildActionIcon(
                                          icon: Icons.bookmark_outlined,
                                          onTap: () {},
                                        ),
                                        _buildActionIcon(
                                          icon: Icons.favorite,
                                          onTap: () {},
                                        ),
                                        _buildActionIcon(
                                          icon: Icons.share,
                                          onTap: () {},
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: screenWidth < 600 ? 7 : 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${item['title']}',
                                      style: TextStyles.MontserratMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: screenHeight * 0.005),
                                    Text(
                                      'Opening hours',
                                      style: TextStyles.MontserratSemibold1,
                                    ),
                                    SizedBox(height: screenHeight * 0.002),
                                    _buildInfoContainer(
                                        '${item['openingHours']}',
                                        screenWidth,
                                        screenHeight),
                                    SizedBox(height: screenHeight * 0.002),
                                    Text(
                                      'Facilities',
                                      style: TextStyles.MontserratSemibold1,
                                    ),
                                    SizedBox(height: screenHeight * 0.002),
                                    Wrap(
                                      spacing: screenWidth * 0.005,
                                      children:
                                          (item['facilities'] as List<dynamic>)
                                              .map((facility) {
                                        return Padding(
                                          padding: EdgeInsets.all(
                                              screenWidth * 0.005),
                                          child: _buildFacilityBadge(
                                            facility: facility,
                                            icon: controller
                                                .facilityIcons[facility],
                                            screenWidth: screenWidth,
                                            screenHeight: screenHeight,
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                    SizedBox(height: screenHeight * 0.01),
                                    _buildActionButton(
                                      label: 'Get Directions',
                                      onTap: () {},
                                      isPrimary: true,
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight,
                                    ),
                                    // Row(
                                    //   children: [
                                    //     _buildActionButton(
                                    //       label: 'Call now',
                                    //       onTap: () {},
                                    //       screenWidth: screenWidth,
                                    //       screenHeight: screenHeight,
                                    //     ),
                                    //     SizedBox(width: screenWidth * 0.01),
                                    //     _buildActionButton(
                                    //       label: 'Get Directions',
                                    //       onTap: () {},
                                    //       isPrimary: true,
                                    //       screenWidth: screenWidth,
                                    //       screenHeight: screenHeight,
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

Widget _buildActionIcon({required IconData icon, required VoidCallback onTap}) {
  return ClipOval(
    child: Material(
      color: AppColors.whitecolor1,
      child: InkWell(
        splashColor: Colors.red,
        onTap: onTap,
        child: SizedBox(
          width: 23,
          height: 23,
          child: Icon(
            icon,
            size: 15,
            color: AppColors.contcolor1,
          ),
        ),
      ),
    ),
  );
}

Widget _buildInfoContainer(
    String text, double screenWidth, double screenHeight) {
  return Container(
    height: screenHeight * 0.03,
    width: screenWidth * 0.30,
    decoration: BoxDecoration(
      color: AppColors.whitecolor,
      borderRadius: BorderRadius.circular(5),
    ),
    alignment: Alignment.center,
    child: Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Text(
        text,
        style: TextStyles.MontserratMedium1,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  );
}

Widget _buildFacilityBadge(
    {required String facility,
    required IconData? icon,
    required double screenWidth,
    required double screenHeight}) {
  return Container(
    height: screenHeight * 0.03,
    decoration: BoxDecoration(
      color: AppColors.whitecolor,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Icon(icon, size: screenHeight * 0.015, color: AppColors.contcolor1),
          SizedBox(width: screenWidth * 0.01),
          Text(
            facility,
            style: TextStyles.MontserratSemibold2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}

Widget _buildActionButton(
    {required String label,
    required VoidCallback onTap,
    bool isPrimary = false,
    required double screenWidth,
    required double screenHeight}) {
  return Container(
    height: screenHeight * 0.05,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: isPrimary ? AppColors.contcolor1 : Colors.transparent,
      border: Border.all(color: AppColors.contcolor1, width: 1),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: isPrimary
                ? TextStyles.Montserratbold5
                : TextStyles.Montserratbold4,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(width: 10,),
          Icon(
            Icons.navigation,
            color: Colors.white,
          )
        ],
      ),
    ),
  );
}
