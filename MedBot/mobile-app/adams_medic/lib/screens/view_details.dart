import 'package:adams_medic/db/detailService.dart';
import 'package:adams_medic/models/details.dart';
import 'package:adams_medic/screens/edit_details.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {
  final Details details;

  DetailsView(this.details);

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.details.name),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "                                                            ",
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.right,
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      DetailService detailService =
                          DetailService(widget.details.toMap());
                      detailService.deleteDetails();
                      Navigator.pop(context);
                      //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      DetailService detailService =
                          DetailService(widget.details.toMap());
                      detailService.updateDetails();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditDetails(widget.details)));
                    },
                  )
                ],
              ),
              Divider(),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                widget.details.name,
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 12.0),
              Text(
                widget.details.hospital,
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 12.0),
              Text(
                widget.details.location,
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 12.0),
              Text(
                widget.details.patient,
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 12.0),
              Text(
                widget.details.specialization,
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 12.0),
              Text(
                widget.details.time,
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ));
  }
}
