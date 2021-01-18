import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tesla_redis/src/core/networking/api_response.dart';
import 'package:tesla_redis/src/core/provider/rockets_provider.dart';
import 'package:tesla_redis/src/ui/home/rockets_list.dart';
import '../widgets/error.dart';

class RocketsHome extends StatefulWidget {
  RocketsHome({
    Key key,
  }) : super(key: key);

  @override
  _RocketsHomeState createState() => _RocketsHomeState();
}

class _RocketsHomeState extends State<RocketsHome> {
  final ValueNotifier<Map<int, dynamic>> _translationNotifier = ValueNotifier({
    /// 'xOffset'
    1: 0.0,

    /// 'yOffset'
    2: 0.0,

    ///'scaleFactor'
    3: 1.0,

    /// 'isdraweropen'
    4: false,
  });

  @override
  void dispose() {
    _translationNotifier.dispose();
    super.dispose();
  }

  void setDrawerState([bool drawerState, Size size]) {
    !drawerState
        ? _translationNotifier.value = {
            1: size.width * 0.6,
            2: size.width * 0.5,
            3: 0.8,
            4: true,
          }
        : _translationNotifier.value = {
            1: 0.0,
            2: 0.0,
            3: 1.0,
            4: false,
          };
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;

    ///
    return ValueListenableBuilder<Map<int, dynamic>>(
      valueListenable: _translationNotifier,
      builder: (context, value, child) => AnimatedContainer(
        decoration: BoxDecoration(color: theme.canvasColor),
        transform: Matrix4.translationValues(value[1], value[2], 0)
          ..scale(value[3]),
        duration: Duration(milliseconds: 250),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(value[4] ? Icons.close : Icons.menu),
                    onPressed: () {
                      setDrawerState(value[4], size);
                    },
                  ),
                  Text('Rockets'),
                ],
              ),
              Expanded(
                child: Consumer<RocketsProvider>(
                  builder: (_, myModel, __) {
                    switch (myModel.rocketsList.status) {
                      case Status.LOADING:
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[200],
                          highlightColor: Colors.grey[350],
                          child: const RocketListShimmer(),
                        );

                        break;

                      case Status.COMPLETED:
                        return RocketsList(
                          rocketList: [...myModel.rocketsList?.data],
                        );

                        break;

                      case Status.ERROR:
                        return Error(
                          errorMessage: myModel.rocketsList.message,
                          onRetryPressed: () => myModel.fetchRocketsList(),
                        );

                        break;

                      default:
                        return Error(
                          onRetryPressed: () => myModel.fetchRocketsList(),
                        );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RocketListShimmer extends StatelessWidget {
  const RocketListShimmer();
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5 / 1.8,
      ),
      itemBuilder: (_, i) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(4.0),
            ),
          ),
        );
      },
    );
  }
}
