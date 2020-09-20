import 'package:flutter/material.dart';
import 'package:flutterblocapp/models/genre.dart';
import 'package:flutterblocapp/style/theme.dart' as Style;

class GenresList extends StatefulWidget {
  final List<Genre> genres;

  GenresList({
    Key key,
    @required this.genres,
  }) : super(key: key);

  @override
  _GenresListState createState() => _GenresListState(genres);
}

class _GenresListState extends State<GenresList> with TickerProviderStateMixin {
  final List<Genre> genres;
  TabController _tabController;

  _GenresListState(this.genres);
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: genres.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 307.0,
      child: DefaultTabController(
        length: genres.length,
        child: Scaffold(
          appBar: PreferredSize(
              child: AppBar(
                backgroundColor: Style.Colors.mainColor,
                bottom: TabBar(
                  controller: _tabController,
                  indicatorColor: Style.Colors.secondColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3.0,
                  unselectedLabelColor: Style.Colors.titleColor,
                  labelColor: Colors.white,
                  isScrollable: true,
                  tabs: genres.map((Genre genre) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
                      child: Text(
                        genre.name.toUpperCase(),
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                    );
                  }).toList(),
                ),
              ),
              preferredSize: Size.fromHeight(50.0)),
          body: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: null,
          ),
          backgroundColor: Style.Colors.mainColor,
        ),
      ),
    );
  }
}
