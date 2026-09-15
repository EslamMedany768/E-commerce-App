import 'package:e_commerce_app/domain/entities/GetWishListProduct.dart';
import 'package:e_commerce_app/feature/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCardWidget extends StatelessWidget {
  FavProductsEntity product;
  final Color primaryBlue;

  FavoriteCardWidget({
    super.key,
    required this.product,
    required this.primaryBlue,
  });

  @override
  Widget build(BuildContext context) {
    ProductTabViewModel viewModel = BlocProvider.of<ProductTabViewModel>(
      context,
    );
    return Container(
      height: 300,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xFFF1F1F1)),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.circular(4),
                  ),

                  child: Image.network(
                    product.imageCover!,
                    fit: BoxFit.contain,
                  ),
                ),

                // Favorite
                Positioned(
                  right: 7,
                  top: 7,
                  child: InkWell(
                    onTap: () {
                      viewModel.deleteFromWishlist(product.id!);
                    },
                    child: Icon(Icons.favorite, color: primaryBlue, size: 18),
                  ),
                ),
              ],
            ),
          ),

          // Product name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Text(
              product.title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF777777),
                height: 1.3,
              ),
            ),
          ),

          const SizedBox(height: 4),

          const SizedBox(height: 3),

          // Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Row(
              children: [
                Text(
                  'EGP ${product.price!.toString()}',
                  style: TextStyle(
                    color: primaryBlue,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: primaryBlue,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 6),

          // Add to cart
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: SizedBox(
              width: double.infinity,
              height: 25,

              child: ElevatedButton(
                onPressed: () {
                  viewModel.addToCart(product.id!);
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue,
                  foregroundColor: Colors.white,
                  elevation: 0,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),

                  padding: EdgeInsets.zero,
                ),

                child: const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),

          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
