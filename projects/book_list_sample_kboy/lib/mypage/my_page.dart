import 'package:book_list_sample_kboy/edit_profile/edit_profile_page.dart';
import 'package:book_list_sample_kboy/mypage/my_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (_) => MyModel()..fetchUser(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('マイページ'),
          centerTitle: true,
          actions: [
            Consumer<MyModel>(builder: (context, model, child) {
              return IconButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EditProfilePage(model.name!, model.description!),
                      ),
                    );
                    model.fetchUser();
                  },
                  icon: Icon(Icons.edit));
            }),
          ],
        ),
        body: Center(
          child: Consumer<MyModel>(builder: (context, model, child) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Text(model.name ?? 'no name',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text(model.email ?? 'メールアドレスなし'),
                    Text(model.description ?? 'なし'),
                    TextButton(
                        onPressed: () async {
                          // ログアウト処理
                          await model.logout();
                          Navigator.of(context).pop();
                        },
                        child: Text('ログアウト')),
                  ]),
                ),
                if (model.isLoading)
                  Container(
                      color: Colors.black54,
                      child: Center(child: CircularProgressIndicator())),
              ],
            );
          }),
        ),
      ),
    );
  }
}
