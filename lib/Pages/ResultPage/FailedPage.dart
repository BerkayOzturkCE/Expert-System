import 'package:flutter/material.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  _NotFoundPageState createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left),
          iconSize: 40,
          color: Colors.white,
        ),
        centerTitle: true,
        titleSpacing: 25,
        title: Text(
          "Sonuç",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: 60,
        backgroundColor: Color.fromARGB(255, 32, 34, 37),
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 47, 49, 54),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                width: 350,
                height: 250,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/expertsystem-7c788.appspot.com/o/media_result_20220103_e3665e83-36e7-483c-876a-bb2ef65f8cc0.png?alt=media&token=14a892c2-9c59-435f-ba9e-43405dcdb218"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Arızalı donanım bulunamadı. İsterseniz soru ekleyerek arızalı donanımın bulunmasına yardımcı olabilirsiniz",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
