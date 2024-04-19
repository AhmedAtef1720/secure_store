import 'package:flutter/material.dart';import 'package:secure_store/core/utils/AppColors.dart';
import 'package:secure_store/core/utils/textstyle.dart';
import 'package:secure_store/feature/screens/search/presentaition/widgets/search_list.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key, required String searchKey});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _textController = TextEditingController();
  String? search;
  var _length = 0;

  @override
  void initState() {
    super.initState();
    search = _textController.text;
    _length = search!.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('search product',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 55,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 251, 249, 249).withOpacity(.3),
                    blurRadius: 15,
                    offset: const Offset(5, 5),
                  )
                ],
              ),
              child: TextField(
                onChanged: (searchKey) {
                  setState(
                    () {
                      search = searchKey;
                      _length = search!.length;
                    },
                  );
                },
                decoration: InputDecoration(
                  hintText: "search",
                  hintStyle: getbodyStyle(),
                  suffixIcon: SizedBox(
                      width: 50,
                      child: Icon(Icons.search, color: appcolors.primerycolor)),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: _length == 0
                    ? Center(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _length = 1;
                                  });
                                },
                                child: Text('show all products',
                                  style: getTitleStyle(color: appcolors.primerycolor),
                                ),
                              ),
                            
                            ],
                          ),
                        ),
                      )
                    : searchList(
                        searchKey: search ?? '',
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}