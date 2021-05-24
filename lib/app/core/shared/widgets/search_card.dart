import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/user.dart';

class SearchCard extends StatelessWidget {
  final User user;
  final GestureTapCallback onTap;

  const SearchCard({Key key, this.user, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          padding: EdgeInsets.only(bottom: 8),
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: CachedNetworkImage(
                      placeholder: (context, string) => CircularProgressIndicator(),
                      height: 80,
                      width: 80,
                      imageUrl: user.avatarUrl, fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(user.login,
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