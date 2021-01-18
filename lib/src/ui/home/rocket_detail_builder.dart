import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:tesla_redis/src/core/models/rocket.dart';
import 'package:tesla_redis/src/ui/widgets/loading.dart';

class RocketDetailBuilder extends StatelessWidget {
  final _log = Logger('RocketDetailBuilder');
  final RocketResponse rocket;

  final int selectedPhoto;

  RocketDetailBuilder({Key key, @required this.rocket, this.selectedPhoto})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
          child: AnimatedContainer(
        height: MediaQuery.of(context).size.height * 0.4,
        duration: Duration(milliseconds: 300),
        key: key,
        child: CachedNetworkImage(
          imageUrl: rocket.flickrImages[selectedPhoto],
          fit: BoxFit.cover,
          placeholder: (context, url) => Loading(),
        ),
      ),
    );
  }
}
