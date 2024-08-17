import 'package:flutter/material.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';
import 'package:get/get.dart';
import 'package:fluushy/All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/ToiletDetailsController.dart';

class ToiletsDetails_Screen extends StatelessWidget {
  final ToiletDetailsController controller = Get.put(ToiletDetailsController());

  Widget _buildFacilityBadge({
    required String facility,
    required IconData icon,
    required double screenWidth,
    required double screenHeight,
  }) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.01),
      decoration: BoxDecoration(
        color: AppColors.whitecolor,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: screenWidth * 0.05,
            color: AppColors.contcolor1,
          ),
          SizedBox(width: 5),
          Text(facility, style: TextStyles.MontserratMedium5),
        ],
      ),
    );
  }

  Widget _buildActionIcon(
      {required IconData icon, required VoidCallback onTap}) {
    return ClipOval(
      child: Material(
        color: AppColors.whitecolor1,
        child: InkWell(
          splashColor: Colors.red,
          onTap: onTap,
          child: SizedBox(
            width: 40,
            height: 40,
            child: Icon(
              icon,
              size: 20,
              color: AppColors.contcolor1,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whitecolor,
        body: Column(
          children: [
            Image.asset(
              Images.bathroom,
              width: double.infinity,
              fit: BoxFit.fill,
              height: 200,
            ),
            SizedBox(height: 5,),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.greycolor.withOpacity(0.6)),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: AppColors.contcolor1,
                                        child: Container(
                                            padding: EdgeInsets.all(2),
                                            child: CircleAvatar(
                                              radius: 20,
                                              backgroundImage: NetworkImage(
                                                  'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg'),
                                              backgroundColor: Colors.white,
                                            )),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: -5,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: Icon(
                                                Icons.verified,
                                                color: Colors.blue,
                                                size: 15,
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color: Colors.white,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(50),
                                                ),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(1, 2),
                                                    color: Colors.black
                                                        .withOpacity(0.2),
                                                    blurRadius: 1,
                                                  ),
                                                ]),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("John Doe",
                                          style: TextStyles.MontserratMedium),
                                      Text("Owner",
                                          style: TextStyles.Montserratbold4),
                                    ],
                                  ),
                                  Spacer(),
                                  _buildActionIcon(
                                    icon: Icons.call,
                                    onTap: () {},
                                  ),
                                  SizedBox(width: 10),
                                  _buildActionIcon(
                                    icon: Icons.navigation,
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.contcolor1.withOpacity(0.6),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Lavatory Zone",
                                  style: TextStyles.MontserratMedium),
                              SizedBox(height: 2),
                              Text("Central park D-Block, Canada",
                                  style: TextStyles.MontserratSemibold1),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    "Charges \$5",
                                    style: TextStyles.Montserratbold1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    width: 140,
                                    decoration: BoxDecoration(
                                      color: AppColors.whitecolor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.all(1),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 15,
                                          ),
                                          Text(
                                            '4.5',
                                            style: TextStyles.MontserratMedium5,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            'Reviews',
                                            style: TextStyles.MontserratMedium5,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            '(120)',
                                            style: TextStyles.MontserratMedium5,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text('Opening hours',
                                  style: TextStyles.MontserratSemibold6),
                              SizedBox(height: 5),
                              Container(
                                width: 140,
                                decoration: BoxDecoration(
                                  color: AppColors.whitecolor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Text(
                                    '10:00 am to 12:00 pm',
                                    style: TextStyles.MontserratMedium5,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text('Facilities for',
                                  style: TextStyles.MontserratSemibold6),
                              SizedBox(height: 5),
                              Obx(() {
                                return Wrap(
                                  spacing: 1,
                                  children:
                                      controller.facilities.map((facility) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.all(screenWidth * 0.005),
                                      child: _buildFacilityBadge(
                                        facility: facility,
                                        icon:
                                            controller.facilityIcons[facility]!,
                                        screenWidth: screenWidth,
                                        screenHeight: screenHeight,
                                      ),
                                    );
                                  }).toList(),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("About", style: TextStyles.Montserratbold2),
                      SizedBox(height: 5),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consequat dolor odio odio malesuada at condimentum adipiscing iaculis semper.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consequat dolor odio odio malesuada at condimentum adipiscing iaculis semper.condimentum adipiscing iaculis semper.',
                        style: TextStyles.MontserratMedium5,
                      ),
                      SizedBox(height: 20),
                      Text("Ratings & Reviews",
                          style: TextStyles.Montserratbold2),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.contcolor1.withOpacity(0.6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  FlutterRating(
                                    rating: 3,
                                    // rating: stars != null && starLength > 5
                                    //     ? 4.0
                                    //     : (stars ?? 0).toDouble(),
                                    size: 18,
                                    borderColor: Colors.black38,
                                  ),
                                  SizedBox(width: 10,),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 1),
                                    child: Text("4.5 out of 5",
                                        style: TextStyles.MontserratMedium3),
                                  ),

                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Share details of your experience with this Toilet',
                                  style: TextStyles.MontserratSemibold6),
                              SizedBox(height: 10,),
                              SizedBox(height: 30,
                                child: CustomButton4(
                                  style: TextStyles.Montserratbold1,
                                  backgroundColor: AppColors.contcolor1,
                                  onTap: () {},
                                  text: "Write a review",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
