import 'package:flutter/material.dart';
import 'package:local_database2/pages/account_page.dart';

import '../model/user_model.dart';
import '../service/hive_service.dart';
import '../service/log_service.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(2,),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: const Image(
                        image: AssetImage("assets/images/Mamur1.jpg"),
                        width: 85,
                        height: 75,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                const Text("Welcome back!",style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                const SizedBox(height: 5,),
                const Text("Sign in to continue",style: TextStyle(
                    color: Colors.white,fontSize: 18),),
                const SizedBox(height: 40,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                              ),
                              child: TextField(
                                controller: _emailcontroller,
                                decoration: InputDecoration(
                                    icon: const Icon(Icons.person_outline,color: Colors.grey,),
                                    hintText: "User Name",
                                    hintStyle: TextStyle(
                                        color: Colors.grey[400],fontWeight: FontWeight.bold),
                                    border: InputBorder.none
                                ),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                              ),
                              child: TextField(
                                controller: _passwordcontroller,
                                decoration: InputDecoration(
                                    icon: const Icon(Icons.key,color: Colors.grey,),
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        color: Colors.grey[400],fontWeight: FontWeight.bold),
                                    border: InputBorder.none
                                ),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      ]
                  ),
                ),
                const SizedBox(height: 30,),
                Text("Forgot Password", style: TextStyle(
                    color: Colors.grey[500], fontWeight: FontWeight.bold),),
                const SizedBox(height: 30,),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue,
                  ),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        var user  = User(_emailcontroller.text, _passwordcontroller.text);
                        HiveService.storeUser(user);
                        var user2 = HiveService.loadUser();
                        LogService.i(user2.toJson().toString());
                      });
                    },
                    child: const Center(
                      child: Icon(Icons.arrow_forward, color: Colors.white,size: 40,),
                    ),
                  ),
                ),
                const SizedBox(height: 70,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?", style: TextStyle(
                        color: Colors.grey[400], fontWeight: FontWeight.bold,fontSize: 17),),
                    const SizedBox(width: 5,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, AccountPage.id);
                      },
                      child: const Text("SIGN UP", style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold,fontSize: 17),),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
