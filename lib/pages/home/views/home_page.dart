import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rest_api_adix_leilao/pages/home/api/api.dart';
import '../components/Horizontalcard.dart';
import '../components/Verticalcard.dart';
import '../models/home_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  String get title => 'Agenda de Leilões';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Auctions>> mapApi;

  @override
  void initState() {
    super.initState();
    mapApi = responseApi();
    mapApi.then((value) => value.forEach((element) => print(element.toJson())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 212, 212),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Modular.to.navigate('/auth');
          },
        ),
        title: Text(
          widget.title,
        ),
        backgroundColor: const Color.fromARGB(255, 10, 43, 71),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                height: 260.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 260,
                      child: FutureBuilder<List<Auctions>>(
                          future: mapApi,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (BuildContext context, index) {
                                  return HorizontalCardHome(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            "https://bid365.app/storage/auctions/GVQitRtEtDYOcbov1LQkdDXJGz6xt1v8KJf7BCJ4.jpg",
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                    title:
                                        snapshot.data![index].name.toString(),
                                    city: snapshot.data![index].city.toString(),
                                    horas:
                                        snapshot.data![index].date.toString(),
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }

                            return const Scaffold(
                              body: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                const Padding(
                  padding:
                      EdgeInsets.only(left: 0, right: 170, top: 0, bottom: 10),
                  child: SizedBox(
                    child: Text(
                      'AGENDA DE LEILÕES',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: 350,
                  child: FutureBuilder<List<Auctions>>(
                      future: mapApi,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, index) {
                              return CardHome(
                                title: snapshot.data![index].name.toString(),
                                city: snapshot.data![index].city.toString(),
                                horas: snapshot.data![index].date.toString(),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        return const Scaffold(
                          body: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
