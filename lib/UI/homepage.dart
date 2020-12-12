import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leadevent/bloc/HomepageBloc/HomepageBloc.dart';
import 'package:leadevent/bloc/HomepageBloc/HomepageState.dart';
import 'package:leadevent/config/theme.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class MyHomepageView extends StatefulWidget {
  final Function changeView;

  const MyHomepageView({Key key, this.changeView}) : super(key: key);

  @override
  _MyHomepageViewState createState() => _MyHomepageViewState();
}

class _MyHomepageViewState extends State<MyHomepageView> {
  final List<Widget> tabs = <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
      child: Tab(text: 'Upcoming'),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
      child: Tab(text: 'Previous'),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
      child: Tab(text: 'Applied'),
    ),
  ];

  /*Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Wrap(
              children: [
                ChoiceChip(
                  label: Text('Small'),
                  selected: false,
                  onSelected: (bool selected) {
                    setState(() {});
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                ChoiceChip(
                  label: Text('Big'),
                  selected: true,
                  onSelected: (bool selected) {
                    setState(() {});
                  },
                  selectedColor: Theme.of(context).accentColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<HomepageBloc, HomepageState>(
        listener: (context, state) {},
        builder: (context, state) {
          var bloc = BlocProvider.of<HomepageBloc>(context);
          if (state is HomepageEventsState) {
            return SafeArea(
              child: DefaultTabController(
                length: tabs.length,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.sidePadding),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Shoots & Events",
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  decoration: TextDecoration.none,
                                  color: Colors.black),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    bottom: AppSizes.sidePadding)),
                            TabBar(
                              indicatorSize: TabBarIndicatorSize.tab,
                              labelColor: AppColors.white,
                              labelPadding: EdgeInsets.symmetric(horizontal: 4),
                              unselectedLabelColor: AppColors.black,
                              indicator: RectangularIndicator(
                                color: Colors.blueAccent,
                                paintingStyle: PaintingStyle.fill,
                              ),
                              tabs: tabs,
                              unselectedLabelStyle: _theme.textTheme.headline4,
                              labelStyle: _theme.textTheme.headline4
                                  .copyWith(color: AppColors.white),
                            ),
                          ]),
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: AppSizes.sidePadding)),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.sidePadding),
                        child: TabBarView(
                          children: <Widget>[
                            buildOrderList(state.orderData, bloc),
                            buildOrderList(state.orderData, bloc),
                            buildOrderList(state.orderData, bloc),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        });
  }

  ListView buildOrderList(List<UserOrder> orders, ProfileBloc bloc) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return OpenFlutterOrderTile(
            order: orders[index],
            onClick: ((int orderId) => {
                  bloc..add(ProfileMyOrderDetailsEvent(orderId)),
                  widget.changeView(changeType: ViewChangeType.Exact, index: 7)
                }),
          );
        });
  }
}
