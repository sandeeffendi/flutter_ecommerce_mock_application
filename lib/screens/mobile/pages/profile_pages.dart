import 'package:flutter/material.dart';
import 'package:my_submission_app/model/user_info.dart';
import 'package:my_submission_app/services/shared_prefs_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePages extends StatefulWidget {
  const ProfilePages({super.key});

  @override
  State<ProfilePages> createState() => _ProfilePagesState();
}

class _ProfilePagesState extends State<ProfilePages> {
  String? username = '';
  String? email = '';

  //init state
  @override
  void initState() {
    super.initState();
    getUsername();
    getUserEmail();
  }

  // Get username
  Future<void> getUsername() async {
    final prefService = SharedPrefsServices();
    final name = await prefService.getUsername();
    setState(() {
      username = name;
    });
  }

  // Get userEmail
  Future<void> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final userEmail = prefs.getString('userEmail');
    setState(() {
      email = userEmail;
    });
  }

  // Get userEmail
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            // Top container
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    style: ElevatedButton.styleFrom(minimumSize: Size(10, 30)),
                    child: Icon(Icons.arrow_back, size: 24),
                  ),
                ),
              ),
            ),

            // Bottom Display
            Expanded(
              flex: 9,
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsGeometry.only(
                                left: 25,
                                top: 50,
                              ),
                              child: Text(
                                username ?? '',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsGeometry.only(
                                left: 25,
                                top: 10,
                              ),
                              child: Text(
                                email ?? '',
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(color: Colors.grey.shade700),
                              ),
                            ),
                          ],
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsGeometry.only(
                                right: 25,
                                top: 50,
                              ),
                              child: Text(
                                'Rp. 0',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsGeometry.only(
                                right: 25,
                                top: 10,
                              ),
                              child: Text(
                                'Balance',
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(color: Colors.grey.shade700),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // User Information
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 25,
                        ),
                        child:
                            // Grid Order ,Level ,Cart ,Favorite
                            GridView.builder(
                              itemCount: info.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                              itemBuilder: (context, index) {
                                final item = info[index];
                                return Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.tertiary,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(item.icon, size: 35),
                                      Text(
                                        item.title,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelLarge,
                                      ),
                                      Text(
                                        item.subTitle,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelLarge,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
