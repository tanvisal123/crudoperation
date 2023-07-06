import 'package:crudoperation/Model.dart';
import 'package:flutter/cupertino.dart';

class InsertItem with ChangeNotifier{

  List<UserModel>list = [];
 int selectedindex = -1;

  void insert(TextEditingController emailcontroller,TextEditingController passwordcontroller){
    list.add(UserModel(password: passwordcontroller.text, email: emailcontroller.text));
    notifyListeners();
  }
  void removeitem (UserModel model){
    list.remove(model);
    notifyListeners();
  }
  void edit ({required TextEditingController emailcontroller,required TextEditingController passwordcontroller ,required UserModel model,required int i}){
    selectedindex = i;
    notifyListeners();
    print(selectedindex);
    emailcontroller.text = model.email;
    passwordcontroller.text = model.password;
    notifyListeners();
  }

    void update (TextEditingController emailcontroller,TextEditingController passwordcontroller,UserModel model,){
    String ?email=emailcontroller.text.trim();
    String ?password=passwordcontroller.text.trim();
    list[selectedindex].email = email;
    list[selectedindex].password = password;
    print("Success");
     notifyListeners();
    }
}