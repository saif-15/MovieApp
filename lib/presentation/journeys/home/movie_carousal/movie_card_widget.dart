import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/data/core/api_constants.dart';
import 'package:movieapp/common/extensions/size_extension.dart';

class MovieCardWidget extends StatelessWidget {
  final int index;
  final String posterPath;

  MovieCardWidget({@required this.index, @required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
      elevation: 32,
      child: GestureDetector(
        onTap: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
          child: CachedNetworkImage(
            imageUrl: "${APIConstants.IMAGE_BASE_URL}$posterPath",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
