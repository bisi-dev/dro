import 'package:dro/core/app_export.dart';
import 'package:dro/data/data_export.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var productCount = 1;
  double price = 0;
  double displayPrice = 0;
  var _drugObject = {};
  bool isFav = false;

  @override
  void didChangeDependencies() {
    _drugObject =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    price = double.parse(_drugObject['price']);
    displayPrice = double.parse(_drugObject['price']);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AltAppBar(
              title: 'Pharmacy',
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.all(kPaddingS),
                width: kScreenWidth(context) * 0.70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Image.asset(_drugObject['imageUri'], fit: BoxFit.cover,),
              ),
            ),
            Center(
              child: Text(
                _drugObject['title'],
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: kBlack,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Center(
              child: Text(
                ' ${_drugObject['type']} - ${_drugObject['weight']}mg',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ),
            //Banner
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: kPaddingM),
                    child: Image.asset(AssetsImages.itemBrandColor)),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(kPaddingS),
                    child: RichText(
                      text: TextSpan(
                        text: 'SOLD BY\n',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Emzor Pharmaceuticals',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Color(0xFF13447A))),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(kPaddingM),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(10, 160, 93, 226),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: IconButton(
                      icon: Icon(isFav
                              ? Icons.favorite
                              : Icons
                                  .favorite_border // : Icons.favorite_border,
                          ),
                      color: Theme.of(context).colorScheme.secondary,
                      onPressed: () {
                        setState(() {
                          isFav = !isFav;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: kPaddingM + 2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                            Icons.remove), // : Icons.favorite_border,
                        color: kBlack,
                        onPressed: () {
                          if (productCount < 2) {
                            setState(() {
                              productCount = 1;
                              displayPrice = price * productCount;
                              log(productCount.toString(), name: 'Add to Cart');
                            });
                          } else {
                            setState(() {
                              --productCount;
                              displayPrice = price * productCount;
                              log(productCount.toString(), name: 'Add to Cart');
                            });
                          }
                        },
                      ),
                      Text(
                        '$productCount',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: kBlack,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add), // : Icons.favorite_border,
                        color: kBlack,
                        onPressed: () {
                          if (productCount < 8) {
                            setState(() {
                              productCount++;
                              displayPrice = price * productCount;
                              log(productCount.toString(), name: 'Add to Cart');
                            });
                          } else {
                            Fluttertoast.showToast(
                                msg: 'Product has reached MAX capacity',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: kGrey,
                                textColor: kBlack,
                                fontSize: 16.0);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Pack(s)',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: kPaddingM),
                    child: RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                        text: '₦ ',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: kBlack,
                            fontSize: 18,
                            fontWeight: FontWeight
                                .w700), // superscript implementation seemed almost not possible
                        children: <TextSpan>[
                          TextSpan(
                            text: displayPrice.toString().substring(
                                0, displayPrice.toString().indexOf('.')),
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              color: kBlack,
                            ),
                          ),
                          const TextSpan(
                            text: '.00',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: kBlack,
                                // fontFeatures: [FontFeature.subscripts()],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //product details
            const Padding(
              padding: EdgeInsets.only(
                  left: kPaddingM, top: kPaddingS, bottom: kPaddingS),
              child: Text(
                'PRODUCT DETAILS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xFF8EA5BC),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: kPaddingM),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // spacing: 20,
                // runAlignment: WrapAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProductDetails(AssetsImages.doubleCapsule, 'PACK SIZE',
                          '8 x 12 tablets (96)'),
                      _buildProductDetails(AssetsImages.singleCapsule,
                          'CONSTITUENTS', '${_drugObject['title']}'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: kPaddingSx),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProductDetails(
                            AssetsImages.qrCode, 'PRODUCT ID', 'PRO23648856'),
                        _buildProductDetails(
                            AssetsImages.qrCode, 'DISPENSED IN', 'Packs'),
                      ],
                    ),
                  ),


                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kPaddingM),
              child: Text(
                '1 pack of ${_drugObject['title']} (${_drugObject['weight']}mg) contains 8 units of 12 tablets.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: const Color.fromARGB(127, 0, 0, 0),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: kPaddingM),
              child: Text(
                'Similar products',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: kBlack,
                    ),
              ),
            ),
            SizedBox(
              height: kGetOrientation(context) == Orientation.landscape
                  ? kScreenHeight(context) * 0.50
                  : kScreenHeight(context) * 0.25,
              child: ListView.builder(
                itemBuilder: (ctx, index) => InkWell(
                  onTap: () {

                  },
                  child: _buildSimilarProducts(context, index),
                ),
                scrollDirection: Axis.horizontal,
                itemCount: suggestionsData.length,
              ),
            ),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is CartLoaded) {
                  Suggestions item = Suggestions(
                      title: _drugObject['title'],
                      imageUri: _drugObject['imageUri'],
                      drugType: _drugObject['type'],
                      weight: _drugObject['weight'],
                      price: _drugObject['price'],
                      qty: productCount.toString(),
                      requiresPrescription:
                          _drugObject['requiresPrescription']);

                  final titleExistInCart = state.cart.items
                      .any((drug) => drug.title == _drugObject['title']);
                  final isInCart = state.cart.items.contains(item);
                  //  final cartObj = {'drug': item.toJson(), 'amount': productCount};
                  return InkWell(
                    onTap: () {
                      if (titleExistInCart) {
                        Fluttertoast.showToast(
                            msg:
                                'Product already added, Please make changes in the cart page.',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: kGrey,
                            textColor: kBlack,
                            fontSize: 16.0);
                      } else if (isInCart) {
                        Fluttertoast.showToast(
                            msg: 'Product already added',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: kGrey,
                            textColor: kBlack,
                            fontSize: 16.0);
                      } else {
                        context.read<CartBloc>().add(CartItemAdded(item));

                        _openBottomSheet(context, _drugObject['title']);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kPaddingS),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            stops: [
                              0.43,
                              0.8
                            ], // 10% of the width, so there are ten blinds.
                            colors: <Color>[
                              Color(0xFF7A08FA),
                              Color(0xFFAD3BFC),
                            ],
                          )),
                      width: double.infinity,
                      padding: const EdgeInsets.all(kPaddingM),
                      margin: const EdgeInsets.all(kPaddingM),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              'Add to Cart',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: kWhite,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return const Text('something went wrong');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductDetails(String imageUri, String title, String details) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(imageUri),
        Padding(
          padding: const EdgeInsets.all(kPaddingS),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Color(0xFF8EA5BC),
                ),
              ),
              Text(
                details,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xFF13447A),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSimilarProducts(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.only(
          left: kPaddingS, right: kPaddingS, bottom: kPaddingS),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(Routes.productDetails, arguments: {
            'title': suggestionsData[index].title,
            'imageUri': suggestionsData[index].imageUri,
            'type': suggestionsData[index].drugType,
            'weight': suggestionsData[index].weight,
            'price': suggestionsData[index].price,
            'qty': suggestionsData[index].qty,
            'requiresPrescription': suggestionsData[index].requiresPrescription,
          });
        },
        child: PhysicalModel(
          color: kWhite,
          elevation: 4,
          borderRadius: BorderRadius.circular(8),
          shadowColor: kGrey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 100,
                //constraints: const BoxConstraints.expand(width: 150, height: 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.asset(
                  suggestionsData[index].imageUri,
                  fit: BoxFit.fill,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          suggestionsData[index].title,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text('${suggestionsData[index].drugType} • '
                          '${suggestionsData[index].weight}mg'),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          '₦${suggestionsData[index].price}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //opens a bottom sheet to get video options
  void _openBottomSheet(BuildContext ctx, String title) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.0),
        ),
      ),
      context: ctx,
      builder: (_) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(kPaddingL),
              child: Text(
                '$title has been succesfully added to cart',
                style: Theme.of(ctx).textTheme.bodyMedium!.copyWith(
                      color: kBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(ctx).pushReplacementNamed(Routes.cart),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kPaddingS),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [
                        0.43,
                        0.8
                      ], // 10% of the width, so there are ten blinds.
                      colors: <Color>[
                        Color(0xFF7A08FA),
                        Color(0xFFAD3BFC),
                      ],
                    )),
                width: double.infinity,
                padding: const EdgeInsets.all(kPaddingM),
                margin: const EdgeInsets.all(kPaddingM),
                child: Center(
                  child: Text(
                    'VIEW CART',
                    textAlign: TextAlign.center,
                    style: Theme.of(ctx).textTheme.bodyMedium!.copyWith(
                          color: kWhite,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(ctx).pushReplacementNamed(Routes.navScreen);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kPaddingS),
                    border: Border.all(color: kPurple)),
                width: double.infinity,
                padding: const EdgeInsets.all(kPaddingM),
                margin: const EdgeInsets.all(kPaddingM),
                child: Center(
                  child: Text(
                    'CONTINUE SHOPPING',
                    textAlign: TextAlign.center,
                    style: Theme.of(ctx).textTheme.bodyMedium!.copyWith(
                          color: kPurple,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
