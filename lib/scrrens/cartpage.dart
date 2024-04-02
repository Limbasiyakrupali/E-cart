import 'package:ecom/scrrens/utils/allproductdata.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart Page",
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade100,
      body: (ProductData.cartproductdata.isEmpty)
          ? Container(
              alignment: Alignment.center,
              child: const Text(
                "Data is not Available",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.grey,
                ),
              ),
            )
          : Column(
              children: [
                Expanded(
                    flex: 8,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...ProductData.cartproductdata.map((e) {
                              return Container(
                                height: 150,
                                margin: EdgeInsets.only(bottom: 10),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(7),
                                      bottomRight: Radius.circular(7),
                                    ),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        blurRadius: 4,
                                        spreadRadius: 1,
                                        color: Colors.grey.shade400,
                                        offset: Offset(0, 2),
                                      ),
                                    ]),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 150,
                                      width: 150,
                                      // width: 150,
                                      // height: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade400,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              e['Thumbnil'],
                                            ),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${e['Productname']}",
                                                  style: TextStyle(
                                                      fontSize: 23,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Text(
                                                  "\$${e['Price']}",
                                                  style: TextStyle(
                                                      fontSize: 26,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black
                                                          .withOpacity(0.7)),
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  ProductData.cartproductdata
                                                      .remove(e);
                                                  ProductData.cartdata
                                                      .remove(e);
                                                });
                                              },
                                              child: Text(
                                                "DELETE",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    decorationColor: Colors.red,
                                                    color: Colors.red),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    child: Container(
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Text(
                          "Total Price:",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 155),
                          child: Text(
                            "\$ ${ProductData.totalprice()}",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ))
              ],
            ),
    );
  }
}
