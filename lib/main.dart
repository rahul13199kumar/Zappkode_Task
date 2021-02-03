import 'package:flutter/material.dart';
import 'new_page.dart';
void main() => runApp(Zappkodeinternshipform());


class Zappkodeinternshipform extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zappkode internship form',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
     home:new HomePage(),
    routes: <String , WidgetBuilder>{
    "/a":(BuildContext context)=>  new NewPage ("New Page"),
    });
  }
}

class HomePage extends StatelessWidget {

  final emailcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final passcontroller = TextEditingController();


  Widget build(BuildContext context){


    final emailField = TextField(
      obscureText: false,
      controller: emailcontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email Here",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );
    final name = TextField(
      obscureText: false,
      controller: namecontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Name Here",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );


    final mobile = TextField(
      obscureText: false,
      controller: mobilecontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Mobile Here",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );


    final passwordField = TextField(
      obscureText: true,
      controller: passcontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "University Name Here",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );


    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.deepPurple,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),

        onPressed: () {
          User user=User();
          user.email=emailcontroller.text;
          user.name=namecontroller.text;
          user.mobile=mobilecontroller.text;
          user.pass=passcontroller.text;

          showAlertDialog(context,user);

        },

        child: Text("Submit",textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),),



      ),
    );
    child: Text("New page",textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white),);

    return Scaffold(

      appBar: AppBar(title: Text("Zappkode internship form")),

      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("Zappkode internship form",style: TextStyle(color:Colors.red)),

                SizedBox(height: 45.0),
                emailField,

                SizedBox(height: 25.0),
                name,

                SizedBox(height: 25.0),
                mobile,

                SizedBox(height: 25.0),
                passwordField,

                SizedBox(height: 35.0,),
                loginButon,
                SizedBox(height: 15.0,),

              ],),),),),);

  }
}



showAlertDialog(BuildContext context,User user){

  Widget gotIt = FlatButton(

    child: Text("Got It"),
    onPressed: () {

      Navigator.of(context, rootNavigator: true).pop('alert');
    },
  );

  AlertDialog alert = AlertDialog(

    title: Text("My title"),

    content: Text(user.email+"\n"+user.name+"\n"+user.mobile+"\n"+user.pass),

    actions: [
      gotIt,
    ],
  );


  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}



//model class
class User{
  String email;
  String name;
  String mobile;
  String pass;

}

