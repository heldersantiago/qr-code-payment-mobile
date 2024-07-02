import 'package:flutter/material.dart';

import '../widgets/ButtomNumberLogin_widget.dart';
import '../widgets/LoginAppBar_widget.dart';

class PgLogin extends StatelessWidget {
  const PgLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        const LoginAppBarWidget(),
        Container(
          color: const Color.fromRGBO(250, 250, 250, 1),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 60, right: 60, top: 50, bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 6; i++)
                  Container(
                    height: 20,
                    width: 20,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(30)),
                  )
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 25),
          child: const Text(
            'PIN do serviço MULTICAIXA',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int num = 1; num < 4; num++)
              ButtomNumberLoginWidget(number: num)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int num = 4; num < 7; num++)
              ButtomNumberLoginWidget(number: num)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int num = 7; num < 10; num++)
              ButtomNumberLoginWidget(number: num)
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 78),
          child: Row(children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
              child: SizedBox(
                width: 55,
                height: 55,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.black54, width: 2),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'DEL',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                ),
              ),
            ),
            const ButtomNumberLoginWidget(number: 0),
          ]),
        ),
        Container(
          margin:
              const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 35),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black38, width: 1.8),
            ),
          ),
        ),
        const Column(
          children: [
            Text(
              'APOIO AO CLIENTE',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(243, 146, 0, 1),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Linha de Atendimento 24H',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone_outlined,
                  color: Color.fromRGBO(243, 146, 0, 1),
                ),
                Text(
                  ' (+244) 222 642 840 | 923 168 840',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.mail_outline,
                  color: Color.fromRGBO(243, 146, 0, 1),
                ),
                Text(
                  ' suporte.mcxexpress@emis.co.ao',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            )
          ],
        ),
      ]),
    );
  }
}
