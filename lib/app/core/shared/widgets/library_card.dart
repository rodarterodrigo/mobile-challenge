import 'package:flutter/material.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';

class LibraryCard extends StatelessWidget {
  final UserDetail userDetail;
  final GestureTapCallback onTap;

  LibraryCard({Key key, this.userDetail, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(bottom: 8),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(userDetail.login,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(userDetail.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
