import 'package:flutter/material.dart';

class ToolbarWidget extends StatelessWidget {
  const ToolbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       const Expanded(child: Text('4 Etkinliğiniz var')),
        Tooltip(
          message: 'Tüm Etkinlikler',
          child: TextButton(onPressed: (){}, child: Text('All'),),
        ),
        Tooltip(
          message: 'Tamamlanmamış',
          child: TextButton(onPressed: (){}, child: Text('Aktif'),),
        ),
        Tooltip(
          message: 'Tamamlanmış',
          child: TextButton(onPressed: (){}, child: Text('Tamamlanmış'),),
        )
      ],
    );
  }
}
