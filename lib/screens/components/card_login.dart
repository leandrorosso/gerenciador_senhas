import 'package:flutter/material.dart';
import 'package:gerenciador_senhas/models/login.dart';

Widget cardLogin(BuildContext context, int index, Login login) {
  return Container(
    margin: const EdgeInsets.only(bottom: 8, left: 10, right: 10),
    height: 80,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          const BoxShadow(
            color: Color(0x040000),
            blurRadius: 10,
            spreadRadius: 10,
            offset: Offset(0.0, 8.0),
          )
        ],
        color: Colors.black12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  login.titulo!,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  login.username!,
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  login.senha!,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            )
          ],
        )
      ],
    ),
  );
}
