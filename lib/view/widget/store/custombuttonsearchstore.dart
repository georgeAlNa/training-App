import 'package:flutter/material.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';

class CustomButtonSearchStore extends StatelessWidget {
  final String textTitle;
  final String textSubject;
  final String textDate;
  final String textVideo;
  final String textImage;
  final Color color;
  final void Function()? onPressed;
  const CustomButtonSearchStore({
    Key? key,
    required this.textTitle,
    this.onPressed,
    required this.color,
    required this.textSubject,
    required this.textDate,
    required this.textVideo,
    required this.textImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(1),
        margin: const EdgeInsets.all(7),
        height: 300,
        width: 400,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(
              AppImageAsset.backgroundStore,
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColor.color,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 140,
              width: 130,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(15),
                border: Border.all(
                  color: AppColor.color,
                  width: 2,
                ),
                color: AppColor.color,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    textImage,
                  ),
                ),
              ),
            ),
            Text(
              textTitle,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                color: AppColor.whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              textSubject,
              style: const TextStyle(
                fontSize: 20,
                color: AppColor.whiteColor,
              ),
            ),
            Text(
              textDate,
              style: const TextStyle(
                fontSize: 20,
                color: AppColor.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// Container(
//         padding: const EdgeInsets.all(15),
//         margin: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: AppColor.black54Color,
//           border: Border.all(
//             color: AppColor.color,
//             width: 3,
//           ),
//           borderRadius: const BorderRadius.all(
//             Radius.circular(40),
//           ),
//         ),
//         child: Column(
//           children: [
//             Text(
//               textTitle,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//                 color: AppColor.yellowForDesign,
//               ),
//             ),
//             Text(
//               textSubject,
//               style: TextStyle(
//                 // fontWeight: FontWeight.bold,
//                 fontSize: 16,
//                 color: AppColor.yellow100Color,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             Text(
//               textDate,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//                 color: AppColor.yellowForDesign,
//               ),
//             ),
//             Text(
//               textVideo,
//               style: const TextStyle(
//                 // fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//           ],
//         ),
//       ),