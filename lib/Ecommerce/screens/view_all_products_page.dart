import 'package:flutter/material.dart';
import 'package:flutter_learning/Ecommerce/models/product.dart';
import 'package:flutter_learning/Ecommerce/screens/product_detail_page.dart';

class ViewAllProductsPage extends StatefulWidget {
  const ViewAllProductsPage({super.key});

  @override
  State<ViewAllProductsPage> createState() => _ViewAllProductsPageState();
}

class _ViewAllProductsPageState extends State<ViewAllProductsPage> {
  String selectedFilter = 'All Products';
  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = List.from(product);
  }

  void applyFilter(String filter) {
    setState(() {
      selectedFilter = filter;
      if (filter == 'Low to High') {
        filteredProducts.sort((a, b) => a.price.compareTo(b.price),);
      } else if (filter == 'High to Low') {
        filteredProducts.sort((a, b) => b.price.compareTo(a.price),);
      } else if (filter == 'Recently Added') {
        filteredProducts.sort((a, b) => DateTime.parse(b.productCreatedAt).compareTo(DateTime.parse(a.productCreatedAt)),);
      } else {
        filteredProducts = List.from(allProducts);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10.0),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Filter Products',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),),
            ),
            value:selectedFilter,
            items: [
              DropdownMenuItem(child: Text('All Products'), value: 'All Products',),
              DropdownMenuItem(child: Text('Low to High'), value: 'Low to High',),
              DropdownMenuItem(child: Text('High to Low'), value: 'High to Low',), 
              DropdownMenuItem(child:  Text('Recently Added'), value: 'Recently Added',),
            ],
            onChanged:(value) => applyFilter(value!,),
            )),

            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: filteredProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  childAspectRatio: .68,
                  crossAxisSpacing: 10.0, 
                  mainAxisSpacing: 10.0,
                  ),
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (_) => ProductDetailPage(product: product),
                            ),
                            );
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  product.productImage,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                    ),                            ),

                    SizedBox(height: 8.0),
                    Text(
                      product.productName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis ,
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600,),
                    ),

                    SizedBox(height: 4.0),
                    Text(
                      '\$${product.price}',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}