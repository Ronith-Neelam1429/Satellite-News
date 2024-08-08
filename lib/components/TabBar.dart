import 'package:flutter/material.dart';
import 'package:satellite/models/newsCategory.dart';

class TabBarComponent extends StatefulWidget {
  final TabController tabController;
  final bool showFullArticles;

  const TabBarComponent({
    required this.tabController,
    required this.showFullArticles,
    super.key,
  });

  @override
  _TabBarComponentState createState() => _TabBarComponentState();
}

class _TabBarComponentState extends State<TabBarComponent> {
  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(() {
      setState(() {}); // Trigger rebuild when tab changes
    });
  }

  Widget _buildSideScrollingContainers() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double containerWidth = constraints.maxWidth * 0.8;
        return Container(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 16 : 8,
                  right: 8,
                  top: 28,
                  bottom: 0,
                ),
                child: Container(
                  width: containerWidth,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Item ${index + 1}',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TabBar(
            controller: widget.tabController,
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Color.fromARGB(255, 128, 127, 136),
            tabAlignment: TabAlignment.start,
            padding: EdgeInsets.symmetric(horizontal: 6),
            indicator: BoxDecoration(),
            dividerColor: Colors.transparent,
            labelPadding:
                EdgeInsets.zero, // Remove default padding between tabs
            tabs: List.generate(
              newsCategories.length,
              (index) => Tab(
                child: Padding(
                  padding: EdgeInsets.only(
                      right: 15),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8), 
                    decoration: BoxDecoration(
                      color: widget.tabController.index == index
                          ? Color.fromARGB(255, 113, 100, 178)
                          : Theme.of(context).colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      newsCategories[index].name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: widget.tabController,
            children: newsCategories.map((category) {
              if (widget.showFullArticles) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 200.0, // Reduced height
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        title: _buildSideScrollingContainers(),
                        titlePadding: EdgeInsets.zero,
                      ),
                    ),
                    SliverFillRemaining(
                      child: Text(
                        "This is the ${category.name} category",
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              } else {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Divider(
                            color: Theme.of(context).colorScheme.tertiary,
                            thickness: 3,
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 12.0, left: 16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Icon(Icons.trending_up),
                                    ),
                                    SizedBox(width: 7),
                                    Text(
                                      "Trending on Satellite🔥",
                                      style: TextStyle(fontSize: 17),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    // Replace this with your actual news tiles
                  ],
                );
              }
            }).toList(),
          ),
        ),
      ],
    );
  }
}
