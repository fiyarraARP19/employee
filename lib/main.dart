import 'package:employee/screen/karyawan.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Karyawan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  Future<List<Karyawan>>_readJsonData()async{
    final String response = await rootBundle.loadString('assets/karyawan.json');
    final List<dynamic>data = json.decode(response);
    final data.map((json))=> Karyawan.fromJson(json).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Daftar Karyawan'),
      ),
      body: FutureBuilder<List<Karyawan>>(
        future: _readJsonData(),
        builder: (context,snapshot){
          if(snapshot.hasData(){
              return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder:(context, index){
                return ListTile(
                title: Text(
                snapshot.data![index].nama,
                style :TextStyle(
                fontWeight:font Weight.bold,
    ),
                ),
                substitle:Column(
                crossAxisAlignment.start,
                childern:[
                  Text('Umur:${snapshot.data![index].umur}')
                  Text(
                  'Alamat: $snapshot.data![index].alamat.jalan},'
                  '${snapshot.data![index].alamat.kota},'
                  '${snapshot.data![index].alamat.Provinsi}'
                ],
                ),
                );
              }else if(snapshot.hasError){
                return Center(
                child:Text(${snapshot,error}),
                );
              }
              return Center(
              child:CircularProgressIndicator(),
              );
        },
      ),
    );
  }
}



