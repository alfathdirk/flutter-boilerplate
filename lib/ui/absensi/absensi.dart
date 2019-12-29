
import 'package:flutter/material.dart';
import 'package:kalaapp/injector/modules/store_component.dart';
import 'package:kalaapp/widgets/dialogWidget.dart';

import '../../router.dart';

class Absensi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AbsensiState();
}

class _AbsensiState extends State<Absensi> {
  int _selectedAbsen = 1;
  String selectedName = '';

  final _store = StoreComponents.absensiState;

  List<String> itemMasuk = ["Normal","Flexiplace","Flextime","Lembur", "Shift", "Perjalanan Dinas", "Main Cewek", "kemana-mana", "terserah lu"];
  List<String> itemTidakMasuk = ["Shift", "Perjalnan Dinas"];
  List<String> typeAbsen = ["Masuk", "Pulang"];

  @override
  void initState() {
    super.initState();
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      flexibleSpace: Image(
        image: AssetImage('assets/images/background_login.png'),
        fit: BoxFit.cover,
      ),
      backgroundColor: Colors.transparent,
      title: Text('Absensi'),
    );
  }
  
  void selectButton(value) {
    setState(() {
      _selectedAbsen = value;
    });
  }

  void selectItem(BuildContext context, value) {
    _store.setTitle(typeAbsen[value]);
    Navigator.of(context).pushNamed(Routes.inOutAbsen, arguments: typeAbsen[value]);
  }

  void _showModalInOutAbsen(BuildContext context) {
    Widget _modal = DialogSelectWidget(data: typeAbsen, height: 150, onSelect: (value) => selectItem(context, value));
    showDialog(context: context, builder: (BuildContext context) => _modal);
  }

  void _selectItemMasuk(idx) {
    setState(() {
      selectedName = itemMasuk[idx];
    });
    Navigator.of(context).pop();
    _showModalInOutAbsen(context);
  }

  void _showModalAbsen(BuildContext context) {
    Widget _modal = DialogSelectWidget(data: itemMasuk, height: 320, onSelect: (value) => _selectItemMasuk(value));
    showDialog(context: context, builder: (BuildContext context) => _modal);
}

  Widget _buildWidgetSelected() {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text('Jenis absensi', style: TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: GestureDetector(
              onTap: () { _showModalAbsen(context); },
              child: Container(
                width: size.width / 1.2,
                child: Text(selectedName),
                padding: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                crossAxisAlignment: _selectedAbsen == 0 ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: _selectedAbsen,
                    onChanged: selectButton
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Masuk', style: TextStyle(fontWeight: FontWeight.bold)),
                      Visibility(
                        visible: _selectedAbsen == 1,
                        child: _buildWidgetSelected(),
                      )
                    ]
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                crossAxisAlignment: _selectedAbsen == 1 ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _selectedAbsen,
                    onChanged: selectButton
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Tidak Masuk', style: TextStyle(fontWeight: FontWeight.bold)),
                      Visibility(
                        visible: _selectedAbsen == 0,
                        child: _buildWidgetSelected(),
                      )
                    ]
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(144, 17, 254, 1),
                    ),
                    child: Text('PILIH', textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                  ),
                )
              ),
            ),
          ],
        ),
      )
    );
  }

}
