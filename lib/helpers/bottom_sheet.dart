import 'package:flutter/material.dart';

class BottomSheetHelper {
  static Future<T?> show<T>(BuildContext context, Widget content) {
    return showModalBottomSheet(
      isScrollControlled: true,
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(12),
          topEnd: Radius.circular(12),
        ),
      ),
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
              width: 50,
              child: Divider(
                thickness: 4,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: content,
            ),
          ],
        );
      },
    );
  }
}
