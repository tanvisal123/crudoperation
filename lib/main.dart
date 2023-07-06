import 'package:crudoperation/crudprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=>InsertItem()),
      ],child: const crud(),)

  );
}
class crud extends StatelessWidget {
  const crud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  //int selectedindex = -1;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InsertItem>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crud Operation"),
      ),
      body: Column(
        children: [
          TextField(
            controller: emailcontroller,
            decoration: const InputDecoration(
              label: Text("Email")
            ),
          ),
          TextField(
            controller: passwordcontroller,
            decoration: const InputDecoration(
              label: Text("Password"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(child: const Text("Save"), onPressed: (){
                provider.insert(emailcontroller, passwordcontroller);
              }),
              CupertinoButton(child: const Text("Update"), onPressed: (){
                provider.update(emailcontroller, passwordcontroller, provider.list[provider.selectedindex]);
              }),
            ],
          ),
          Expanded(child: ListView.builder(
              itemCount: provider.list.length,
              itemBuilder: (BuildContext context,index){
            return ListTile(
              leading: GestureDetector(
                onTap: (){
                provider.edit(emailcontroller: emailcontroller, passwordcontroller: passwordcontroller, model: provider.list[index], i: index);
                  },
                  child: const Icon(Icons.edit)),
              title: Text("${provider.list[index].email}"),
              subtitle: Text("${provider.list[index].password}"),
              trailing: GestureDetector(
                  onTap: (){
                    provider.removeitem(provider.list[index]);
                  },
                  child: const Icon(Icons.remove)),
            );
          }),
          ),
        ],
      ),
    );
  }
}

