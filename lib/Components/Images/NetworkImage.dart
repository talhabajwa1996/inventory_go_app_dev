import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inventory_go/Components/Loaders/GifLoader.dart';
import 'package:inventory_go/Util/globals.dart';
import 'package:inventory_go/Util/image_constants.dart';

Widget appNetworkImage(url,
    {double? width,
    double? height,
    BoxFit? boxFit,
    Color? color,
    bool showLoading = true,
    bool showErrorWidget = true}) {
  String imageUrl = MEDIA_URL + url;
  print(imageUrl);
  return CachedNetworkImage(
    fit: boxFit,
    imageUrl: imageUrl,
    width: width,
    color: color,
    height: height,
    progressIndicatorBuilder: (context, url, downloadProgress) => showLoading
        ? Center(
            child: GifLoader(
            value: downloadProgress.progress,
            strokeWidth: 1.5,
          ))
        : const SizedBox(),
    errorWidget: (context, url, error) => showErrorWidget
        ? Image.asset(
            ImageConstants.noImage,
            height: height,
            width: width,
          )
        : SizedBox(),
  );
}

ImageProvider appNetworkImageProvider(url,
    {double? width,
    double? height,
    BoxFit? boxFit,
    Color? color,
    bool showLoading = true,
    bool showErrorWidget = true}) {
  String imageUrl = MEDIA_URL + url;
  print(imageUrl);
  return CachedNetworkImageProvider(
    imageUrl,
    // maxWidth: width!.toInt(),
    // maxHeight: height!.toInt(),
  );
}
