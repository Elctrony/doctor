import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DoctorListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors List'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height -
            AppBar().preferredSize.height -
            MediaQuery.of(context).viewPadding.top,
        child: StreamBuilder<QuerySnapshot>(
          builder: (context, dataSnapshot) {
            return dataSnapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : dataSnapshot.data == null
                    ? Center(
                        child: Text('No Data Available'),
                      )
                    : Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 6,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(25),
                                      bottomLeft: Radius.circular(25))),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 20,
                                  child: Text(
                                      '${dataSnapshot.data.documents[index].data['fee']}\$'),
                                  backgroundColor: Colors.red,
                                ),
                                title: Text(
                                    '${dataSnapshot.data.documents[index].data['name']}'),
                                subtitle: Text(
                                    '${dataSnapshot.data.documents[index].data['phone']}'),
                                trailing: Text(
                                  '${dataSnapshot.data.documents[index].data['city']}, ${dataSnapshot.data.documents[index].data['address']}',
                                ),
                              ),
                            );
                          },
                          itemCount: dataSnapshot.data.documents.length,
                        ),
                      );
          },
          stream: Firestore.instance.collection('doctor').snapshots(),
        ),
      ),
    );
  }
}
