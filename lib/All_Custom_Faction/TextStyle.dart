import 'package:flutter/material.dart';

import 'Colors.dart';

class TextStyles {
  static const TextStyle MontserratRegular = TextStyle(
      fontSize: 13.0,
      fontFamily: 'MontserratRegular',
      color: AppColors.whitecolor,
  height: 1

  );

  static const TextStyle MontserratRegular1 = TextStyle(
      fontSize: 7.0,
      fontFamily: 'MontserratRegular',
      color: AppColors.blackcolor);

  static const TextStyle MontserratRegular2 = TextStyle(
      fontSize: 12.0,
      fontFamily: 'MontserratRegular',
      color: AppColors.greycolor);

  static const TextStyle MontserratRegular3 = TextStyle(
      fontSize: 15.0,
      fontFamily: 'MontserratRegular',
      color: AppColors.buttoncolor);

  static const TextStyle MontserratRegular4 = TextStyle(
      fontSize: 12.0,
      fontFamily: 'MontserratRegular',
      color: AppColors.greycolor);

  static const TextStyle MontserratRegular5 = TextStyle(
      fontSize: 18.0,
      fontFamily: 'MontserratRegular',
      color: AppColors.whitecolor);

  static const TextStyle MontserratRegular6 = TextStyle(
      fontSize: 15.0,
      fontFamily: 'MontserratRegular',
      color: AppColors.blackcolor);

  static const TextStyle MontserratRegular7 = TextStyle(
      fontSize: 12.0,
      fontFamily: 'MontserratRegular',
      color: AppColors.whitecolor);


  static const TextStyle MontserratRegular8 = TextStyle(
      fontSize: 30.0,
      fontFamily: 'MontserratRegular',
      color: AppColors.contcolor1);

  static const TextStyle MontserratMedium = TextStyle(
      fontSize: 15.0,
      fontFamily: 'MontserratMedium',
      color: AppColors.blackcolor);


  static const TextStyle MontserratMedium1 = TextStyle(
      fontSize: 8.0,
      fontFamily: 'MontserratMedium',
      color: AppColors.contcolor1);


  static const TextStyle MontserratMedium2 = TextStyle(
      fontSize: 15.0,
      fontFamily: 'MontserratMedium',
      color: AppColors.greycolor);

  static const TextStyle MontserratMedium3 = TextStyle(
      fontSize: 15.0,
      fontFamily: 'MontserratMedium',
      color: AppColors.whitecolor);

  static const TextStyle MontserratMedium4 = TextStyle(
      fontSize: 10.0,
      fontFamily: 'MontserratMedium',
      color: AppColors.whitecolor);

  static const TextStyle MontserratMedium5 = TextStyle(
      fontSize: 12.0,
      fontFamily: 'MontserratMedium',
      color: AppColors.blackcolor);

  static const TextStyle MontserratMedium6 = TextStyle(
      fontSize: 15.0,
      fontFamily: 'MontserratMedium',
      color: AppColors.contcolor1);

  static const TextStyle Montserratbold = TextStyle(
      fontSize: 23.0,
      fontFamily: 'Montserratbold',
      color: AppColors.blackcolor);


  static const TextStyle Montserratbold1 = TextStyle(
      fontSize: 16.0,
      fontFamily: 'Montserratbold',
      color: AppColors.whitecolor);

  static const TextStyle Montserratbold2 = TextStyle(
      fontSize: 18.0,
      fontFamily: 'Montserratbold',
      color: AppColors.blackcolor);

  static const TextStyle Montserratbold3 = TextStyle(
      fontSize: 15.0,
      fontFamily: 'Montserratbold',
      color: AppColors.whitecolor);

  static const TextStyle Montserratbold4 = TextStyle(
      fontSize: 10.0,
      fontFamily: 'Montserratbold',
      color: AppColors.blackcolor);

  static const TextStyle Montserratbold5 = TextStyle(
      fontSize: 10.0,
      fontFamily: 'Montserratbold',
      color: AppColors.whitecolor);

  static const TextStyle Montserratbold6 = TextStyle(
      fontSize: 25.0,
      fontFamily: 'Montserratbold',
      color: AppColors.blackcolor);
  static const TextStyle Montserratbold7 = TextStyle(
      fontSize: 10.0,
      fontFamily: 'Montserratbold',
      color: AppColors.blackcolor);

  static const TextStyle Montserratbold8 = TextStyle(
      fontSize: 12.0,
      fontFamily: 'Montserratbold',
      color: AppColors.blackcolor);

  static const TextStyle Montserratbold9 = TextStyle(
      fontSize: 50.0,
      fontFamily: 'Montserratbold',
      color: AppColors.greycolor);


  static const TextStyle MontserratSemibold1 = TextStyle(
      fontSize: 10.0,
      fontFamily: 'MontserratSemibold',
      color: AppColors.blackcolor);

  static const TextStyle MontserratSemibold2 = TextStyle(
      fontSize: 7.0,
      fontFamily: 'MontserratSemibold',
      color: AppColors.greycolor);

  static const TextStyle MontserratSemibold3 = TextStyle(
      fontSize:12.0,
      fontFamily: 'MontserratSemibold',
      color: AppColors.contcolor1);



  static const TextStyle MontserratSemibold4 = TextStyle(
      fontSize:12.0,
      fontFamily: 'MontserratSemibold',
      color: AppColors.whitecolor);




  static const TextStyle MontserratSemibold5 = TextStyle(
      fontSize:15.0,
      fontFamily: 'MontserratSemibold',
      color: Colors.red);
  static const TextStyle MontserratSemibold6 = TextStyle(
      fontSize: 15.0,
      fontFamily: 'MontserratSemibold',
      color: AppColors.blackcolor);



  static const TextStyle MontserratSemibold7 = TextStyle(
      fontSize:30.0,
      fontFamily: 'MontserratSemibold',
      color: AppColors.whitecolor);

}
// Expanded(
// child: Obx(
// () => ListView.builder(
// itemCount: controller.items.length,
// itemBuilder: (context, index) {
// final item = controller.items[index];
// return Container(
// margin: EdgeInsets.symmetric(vertical: 5),
// padding: EdgeInsets.all(2),
// decoration: BoxDecoration(
// color: AppColors.contcolor1.withOpacity(0.7),
// borderRadius: BorderRadius.circular(10),
// ),
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 5),
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Flexible(
// flex: 2,
// child: Image.asset(
// '${item['imageUrl']}',
// fit: BoxFit.cover,
// ),
// ),
// SizedBox(width: 10),
// Flexible(
// flex: 5,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// '${item['title']}',
// style: TextStyles.MontserratMedium,
// overflow: TextOverflow.ellipsis,
// ),
// SizedBox(height: 5),
// Container(
// height: 25,
// alignment: Alignment.center,
// margin: EdgeInsets.only(right: 70),
// decoration: BoxDecoration(
// color: AppColors.whitecolor,
// borderRadius: BorderRadius.circular(5),
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Icon(
// Icons.star,
// color: Colors.amber,
// size: 15,
// ),
// Text(
// '${item['rating']} (${item['reviews']} reviews)',
// style: TextStyles.MontserratRegular1,
// overflow: TextOverflow.ellipsis,
// ),
// ],
// ),
// ),
// SizedBox(height: 5),
// Text(
// 'Opening hours',
// style: TextStyles.MontserratRegular,
// ),
// Container(
// height: 25,
// color: Colors.red,
// width: double.infinity,
// alignment: Alignment.center,
// child: Text(
// '${item['openingHours']}',
// style: TextStyles.MontserratRegular,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// SizedBox(height: 5),
// Text(
// 'Facilities',
// style: TextStyles.MontserratRegular,
// ),
// Wrap(
// spacing: 10,
// children: (item['facilities'] as List<dynamic>).map((facility) {
// return Row(
// mainAxisSize: MainAxisSize.min,
// children: [
// Icon(
// controller.facilityIcons[facility],
// size: 15,
// ),
// SizedBox(width: 5),
// Text(
// facility,
// style: TextStyles.MontserratRegular,
// overflow: TextOverflow.ellipsis,
// ),
// ],
// );
// }).toList(),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// );
// },
// ),
// ),
// )
