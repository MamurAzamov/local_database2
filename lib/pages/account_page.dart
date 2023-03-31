import 'package:flutter/material.dart';
import 'package:local_database2/service/hive_service.dart';

import '../model/account_model.dart';
import '../service/log_service.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);
  static const String id = 'account_page';

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  final _email = TextEditingController();
  final _password = TextEditingController();
  final _userName = TextEditingController();
  final _phoneNumber = TextEditingController();

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
                ),
                const SizedBox(height: 15,),
                const Text("Create Account",style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
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
                                controller: _userName,
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
                                controller: _email,
                                decoration: InputDecoration(
                                    icon: const Icon(Icons.email_outlined,color: Colors.grey,),
                                    hintText: "E-Mail",
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
                                controller: _phoneNumber,
                                decoration: InputDecoration(
                                    icon: const Icon(Icons.call_outlined,color: Colors.grey,),
                                    hintText: "Phone Number",
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
                                controller: _password,
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
                        var user1 = Account(
                           _userName.text, _email.text, _phoneNumber.text, _password.text);
                        HiveService.storeUser(user1);
                        LogService.i(user1.toJson().toString());
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
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Already have an account?", style: TextStyle(
                        color: Colors.grey[400], fontWeight: FontWeight.bold,fontSize: 17),),
                    const SizedBox(width: 5,),
                    GestureDetector(
                      onTap: (){},
                      child: const Text("SIGN IN", style: TextStyle(
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
