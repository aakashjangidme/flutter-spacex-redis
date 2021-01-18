import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tesla_redis/src/core/utils/custom_spacer.dart';

import '../../core/models/rocket.dart';
import 'rocket_detail_builder.dart';

class RocketsList extends StatefulWidget {
  final List<RocketResponse> rocketList;

  const RocketsList({Key key, @required this.rocketList}) : super(key: key);

  @override
  _RocketsListState createState() => _RocketsListState();
}

class _RocketsListState extends State<RocketsList> {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  int _photoIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: 0, viewportFraction: 1, keepPage: true);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var rocket = widget.rocketList[_currentIndex];

    var theme = Theme.of(context);
    return Stack(
      children: [
        Positioned(
          bottom: -50,
          right: -50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: SizedBox(
              height: 200,
              width: 200,
              child: CachedNetworkImage(
                colorBlendMode: BlendMode.darken,
                alignment: Alignment.center,
                imageUrl: rocket.flickrImages[_photoIndex],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,

          crossAxisAlignment: CrossAxisAlignment.start,

 

          children: [
            Container(
              height: 200,
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              child: Stack(
                children: [
                  PageView.builder(
                    physics: BouncingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (index) {
                      _currentIndex = index;

                      /*
  
    
  
        
  
    
  
                      _pageController.animateToPage(
  
    
  
        
  
    
  
                        index,
  
    
  
        
  
    
  
                        duration: Duration(milliseconds: 300),
  
    
  
        
  
    
  
                        curve: Curves.fastOutSlowIn,
  
    
  
        
  
    
  
                      );
  
    
  
    
  
    
  
        
  
    
  
                     */

                      setState(() {});
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.rocketList.length ?? 0,
                    itemBuilder: (_, i) => RocketDetailBuilder(
                      selectedPhoto: _photoIndex,
                      key: ValueKey(widget.rocketList[i]?.id),
                      rocket: widget.rocketList[i],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        // mainAxisSize: MainAxisSize.min,

                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(48),
                              color: Colors.white.withOpacity(0.2),
                            ),
                            child: IconButton(
                              alignment: Alignment.center,
                              icon: Icon(
                                Icons.arrow_back_ios,
                              ),
                              onPressed: _currentIndex == 0
                                  ? null
                                  : () {
                                      _photoIndex = 0;

                                      _pageController.animateToPage(
                                        _currentIndex - 1,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.fastOutSlowIn,
                                      );
                                    },
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(48),
                              color: Colors.white.withOpacity(0.2),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                              ),
                              onPressed: _currentIndex ==
                                      widget.rocketList.length - 1
                                  ? null
                                  : () {
                                      _photoIndex = 0;

                                      _pageController.animateToPage(
                                        _currentIndex + 1,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.fastOutSlowIn,
                                      );
                                    },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              height: 150,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: rocket.flickrImages?.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    _photoIndex = index;

                    setState(() {});
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: _photoIndex == index
                          ? Border.all(color: Colors.green, width: 1)
                          : null,
                    ),
                    margin: EdgeInsets.only(left: index == 0 ? 0 : 8),
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        alignment: Alignment.center,
                        imageUrl: rocket.flickrImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            YMargin(16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                rocket.rocketName,
                style: theme.textTheme.headline6,
              ),
            ),
            YMargin(16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                rocket.description,
                style: theme.textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ],
    );
    /* GridView.builder(
      shrinkWrap: true,
      itemCount: rocketList.length ?? 0,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5 / 1.8,
      ),
      itemBuilder: (_, i) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CachedNetworkImage(
                imageUrl: rocketList[i]?.flickrImages[i],
                fit: BoxFit.fill,
                placeholder: (context, url) => Loading(),
              ),
            ),
          ),
        );
      },
    );
   */
  }
}
