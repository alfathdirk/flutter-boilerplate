import 'package:flutter/material.dart';

class TaskAbsensi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TaskAbsensiState();
}

class _TaskAbsensiState extends State<TaskAbsensi> with SingleTickerProviderStateMixin{
  TabController _controller;
  List<Widget> _buildBody;
  int indexBody = 0;
  bool isVisibleAdd = false;

  void initState() {
    _controller = TabController(length: 2, vsync: this);
    _buildBody = [_sasaranKerja(), _rekapKerja()];

    _controller.addListener(() {
      int indexControl = _controller.index;
      bool isVisible = indexControl == 1 ?? false ;
      setState(() {
        isVisibleAdd = isVisible;
      });
    });
    super.initState();
  }

  Widget _sasaranKerja() {
    List itemsList = ['Daftar Sasaran Kinerja','Penilaian', 'Persetujuan'];
    return ListView.builder(
      itemCount: itemsList.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  print(index);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(itemsList[index]),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
              ),
              Divider(color: Colors.grey, height: 1),
            ],
          ),
        );
      }
    );
  }

  Widget _rekapKerja() {
    List itemsList = ['Kelola Internalisasi Budaya Internal','BRInspirasi', 'BRIlian Share'];
    return ListView.builder(
      itemCount: itemsList.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  print(index);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(itemsList[index]),
                      Icon(Icons.check_circle)
                    ],
                  ),
                ),
              ),
              Divider(color: Colors.grey, height: 1),
            ],
          ),
        );
      }
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
       bottom: TabBar(
        onTap: (int index) {
          setState(() {
            indexBody = index;
          });
        },
        controller: _controller,
        tabs: [
          Tab(child: Text('Sasaran Kerja')),
          Tab(child: Text('Rekap Kerja')),
        ],
      ),
      actions: <Widget>[
        Visibility(
          visible: isVisibleAdd,
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 5.0),
            child: Icon(Icons.add),
          ),
        )
      ],
      flexibleSpace: Image(
        image: AssetImage('assets/images/background_login.png'),
        fit: BoxFit.cover,
      ),
      backgroundColor: Colors.transparent,
      title: Text('Tugas'),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: TabBarView(
        controller: _controller,
        children: _buildBody,
      ),
    );
  }
}
