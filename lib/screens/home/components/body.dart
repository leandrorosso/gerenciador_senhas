import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 16, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Últimos logins cadastrados',
                      style: Theme.of(context).textTheme.bodyText1),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'ver todos',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
