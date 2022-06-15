import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Bloc/ProductBloc.dart';
import 'package:untitled/Event/ProductEvent.dart';
import 'package:untitled/Model/ProductModel.dart';
import 'package:untitled/State/ProductState.dart';
import 'package:untitled/newpage.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';

class ProductView extends StatefulWidget {
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  ProductBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<ProductBloc>(context);
    bloc.add(GetProduct());

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 234, 234),
      appBar: appBar(),
      body: productList(context),
    );
  }

  appBar() {
    return AppBar(
      title: Text(
        "Меню",
      ),
    );
  }

  productList(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoaded) {
          return ScrollableListTabView(
            tabHeight: 48,
            tabs: [
              ScrollableListTab(
                  tab: const ListTab(label: Text('Pizza')),
                  body: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 11,
                    itemBuilder: (context, i) {
                      return productListitem(context, state.product[i]);
                    },
                  )),
              ScrollableListTab(
                  tab: const ListTab(label: Text('Sushi')),
                  body: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 9,
                    itemBuilder: (context, i) {
                      return productListitem(context, state.product[i + 12]);
                    },
                  )),
            ],
          );
        }
        return Container();
      },
    );
  }

  productListitem(BuildContext context, Product product) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 7,
        margin: EdgeInsets.all(16),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewPage(product.name,
                        product.description, product.image, product.price)));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 8, bottom: 8),
                  height: 75,
                  width: 100,
                  child: Image.asset(
                    "assets/images/${product.image}",
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        product.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 8.0, right: 16),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                  "${product.description}\nЦена: ${product.price}₽",
                                  overflow: TextOverflow.fade,
                                  softWrap: false),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
