import 'package:flutter/material.dart';
import 'package:training_app/core/constant/color.dart';

class CustomSearchBar extends StatelessWidget {
  final String titleappbar;
  // final void Function()? onPressedIconFavorite;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;
  const CustomSearchBar(
      {Key? key,
      required this.titleappbar,
      this.onPressedSearch,
      // required this.onPressedIconFavorite,
      this.onChanged,
      required this.mycontroller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        controller: mycontroller,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: const Icon(
              Icons.search,
              color: AppColor.whiteColor,
            ),
            onPressed: onPressedSearch,
          ),
          hintText: titleappbar,
          hintStyle: const TextStyle(
            fontSize: 18,
            color: AppColor.whiteColor,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(40),
          ),
          filled: true,
          fillColor: Colors.black54,
        ),
      ),

      // const SizedBox(width: 10),
      // Container(
      //   decoration: BoxDecoration(
      //       color: Colors.grey[200],
      //       borderRadius: BorderRadius.circular(10)),
      //   width: 60,
      //   padding: const EdgeInsets.symmetric(vertical: 8),
      //   child: IconButton(
      //     onPressed: onPressedIconFavorite,
      //     icon: Icon(
      //       Icons.favorite_border_outlined,
      //       size: 30,
      //       color: Colors.grey[600],
      //     ),
      //   ),
      // ),
    );
  }
}
