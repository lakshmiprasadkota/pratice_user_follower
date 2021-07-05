import 'package:flutter/material.dart';
import '../shimmers/shimmers.dart';
import 'package:pratice_user_followers/models/user_model.dart';
import 'package:pratice_user_followers/network/manager.dart';
import 'package:pratice_user_followers/network/response.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool fetching = true;
  UserDetails? model;
  UserDetails userDetails = UserDetails();

  void getHttp() async {
    setState(() {
      fetching = true;
    });
    try {
      final response = await personalizationManager.fetchNewsCategories();
      // Response response = await dioClient.ref!.get(
      //     "/search/users?q=followers%3A%3E%3D1000&ref=searchresults&s=followers&type=Users");

      if (response.status == ResponseStatus.SUCCESS) {
        setState(() {
          model = response.data;

          fetching = false;
        });
        fetching = false;
        print(response);
      }
    } catch (e) {
      setState(() {
        fetching = false;
      });
      print(e);
    }
  }

  @override
  void initState() {
    getHttp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [buildBody()],
          ),
        ),
      ),
    );
  }

  Widget buildBody() {
    if (fetching) {
      return HomeScreenShimmer();
    }
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 50),
      shrinkWrap: true,
      itemCount: model!.items!.length,
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${model!.items![index].login}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                  model!.items![index].avatarUrl,
                ))
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 20,
        );
      },
    );
  }
}
