import 'package:flutter/material.dart';

import 'package:qrscanner/pages/pages.dart';
import 'package:qrscanner/providers/db_provider.dart';
import 'package:qrscanner/widgets/widgets.dart';

import 'package:provider/provider.dart';
import 'package:qrscanner/providers/ui_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Historial',
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.delete_forever))
          ],
        ),
        body: _HomePageBody(),
        bottomNavigationBar: CustomNavigatorBar(),
        floatingActionButton: ScanButton(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    //Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    ///TODO:temporal leer la base de datos
    DBHelper dbHelper = DBHelper();
    dbHelper.database;

    switch (currentIndex) {
      case 0:
        return MapasPage();

      case 1:
        return DireccionesPages();

      default:
        return MapasPage();
    }
  }
}
