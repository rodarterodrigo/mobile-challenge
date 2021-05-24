import 'package:flutter/material.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';

class LibraryUserDetailPage extends StatefulWidget {
  final UserDetail userDetail;
  LibraryUserDetailPage({Key key, this.userDetail}) : super(key: key);

  @override
  _LibraryUserDetailPageState createState() => _LibraryUserDetailPageState();
}

class _LibraryUserDetailPageState extends State<LibraryUserDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          widget.userDetail.name,
        ),
      ),
    );
  }
}