import 'package:ecom/scrrens/utils/allproductdata.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Page",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 28,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(14),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("CartPage");
              },
              child: Badge(
                label: Text("${ProductData.cartdata.length}"),
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                  size: 29,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                ...data['Images'].map((e) {
                  return Container(
                    height: 400,
                    width: 430,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(e),
                    )),
                  );
                }).toList(),
              ]),
            ),
          ),
          Container(
            height: 410,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      blurRadius: 7,
                      spreadRadius: 3,
                      color: Colors.grey.shade400)
                ]),
            child: Padding(
              padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${data['Productname']}",
                          style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "\$ ${data['Price']}",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.redAccent,
                          ),
                        )
                      ]),
                  SizedBox(height: 25),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Brand",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "${data['Brand']}",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                          ),
                        )
                      ]),
                  SizedBox(height: 25),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Discription",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "${data['Description']}",
                          style: TextStyle(
                            fontSize: 21,
                            letterSpacing: -1,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ]),
                  SizedBox(height: 22),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            ProductData.cartproductdata.add(data);
                            ProductData.cartdata.add(data);
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 65,
                          width: 370,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            "Add To Cart",
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
