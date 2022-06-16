import 'package:dro/core/app_export.dart';
import 'package:dro/data/data_export.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AltAppBar(title: 'Cart',),
            SizedBox(
              height: kScreenHeight(context) * 0.65,
              child: BlocBuilder<CartBloc, CartState>(
                builder: ((context, state) {
                  if (state is CartLoading) {
                    return const CircularProgressIndicator();
                  }
                  if (state is CartLoaded) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          return _buildCardItem(
                              context,
                              state.cart.items[index].imageUri,
                              state.cart.items[index].title,
                              state.cart.items[index].weight,
                              state.cart.items[index].drugType,
                              state.cart.items[index].price,
                              state.cart.items[index].requiresPrescription,
                              state.cart.items[index].qty);
                        },
                        separatorBuilder: (_, __) {
                          return const Divider(color: kGrey);
                        },
                        itemCount: state.cart.items.length);
                  }
                  return const Text('Something occurred');
                }),
              ),
            ),
            BlocConsumer<CartBloc, CartState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is CartLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is CartLoaded) {
                  return Container(
                    margin: const EdgeInsets.all(kPaddingS),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total: ₦${state.cart.totalPrice}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: kBlack,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        InkWell(
                          onTap: (){
                             Fluttertoast.showToast(
                            msg: 'Checkout not supported yet.',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: kGrey,
                            textColor: kBlack,
                            fontSize: 16.0);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(kPaddingS),
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  stops: [0.43, 0.8],
                                  colors: <Color>[
                                    kPurpleGradientLeft,
                                    kPurpleGradienRight,
                                  ],
                                )),
                            padding: const EdgeInsets.all(kPaddingM),
                            margin: const EdgeInsets.all(kPaddingM),
                            width: kScreenWidth(context) * 0.45,
                            child: Center(
                              child: Text(
                                'Checkout',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: kWhite,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
                return const Text('Something occurred');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardItem(BuildContext context, String imageUri, String title, String weight, String type,
      String price, bool requiresPrescription, String noOfItems) {
    Suggestions item = Suggestions(
        title: title,
        imageUri: imageUri,
        drugType: type,
        weight: weight,
        price: price,
        qty: noOfItems,
        requiresPrescription: requiresPrescription);
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Flexible(
            child: Container(
              width: 150,
              height: 100,
              margin: const EdgeInsets.all(kPaddingS),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.asset(
                imageUri,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(kPaddingS),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      color: kBlack,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: kPaddingS),
                    child: Text(
                      '$type \u2022 $weight mg',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: kGrey,
                      ),
                    ),
                  ),
                  BlocConsumer<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is CartLoading) {
                          return const SizedBox();
                        }
                        if (state is CartLoaded) {
                          final drugObj = state.cart.items.firstWhere((drug) => drug.title == title);

                          return Padding(
                            padding: const EdgeInsets.only(top: kPaddingS),
                            child: Text(
                              '₦${double.parse(drugObj.price)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color.fromARGB(226, 54, 54, 54),
                              ),
                            ),
                          );
                        }
                        return const Text('An error occurred.');
                      },
                      listener: (context, state) {}),
                ],
              ),
            ),
          ),
          Flexible(
            child: BlocConsumer<CartBloc, CartState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is CartLoading) {
                  return const SizedBox();
                }
                if (state is CartLoaded) {
                  final drugObj = state.cart.items.firstWhere((drug) => drug.title == title);
                  return Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: kPaddingM),
                          decoration:
                              BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(6)),
                          width: 70,
                          child: AmountDropdownButton(noOfItems: noOfItems, title: drugObj.title)),
                      TextButton.icon(
                        onPressed: () {
                          context.read<CartBloc>().add(CartItemRemoved(item));
                        },
                        icon: const Icon(Icons.delete),
                        label: const Text(
                          'Remove',
                          style: TextStyle(
                            fontSize: 14,
                            color: kBlack,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return const Text('An unexpected error occurred.');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AmountDropdownButton extends StatefulWidget {
  const AmountDropdownButton({Key? key, required this.noOfItems, required this.title}) : super(key: key);

  final String noOfItems;
  final String title;

  @override
  State<AmountDropdownButton> createState() => _AmountDropdownButtonState();
}

class _AmountDropdownButtonState extends State<AmountDropdownButton> {
  String dropdownValue = '1';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: BlocConsumer<CartBloc, CartState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is CartLoading) {
              return const SizedBox();
            }

            if (state is CartLoaded) {
              final drugObj = state.cart.items.firstWhere((drug) => drug.title == widget.title);
              return Center(
                child: DropdownButton<String>(
                  value: drugObj.qty,
                  icon: const Icon(Icons.expand_more),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      drugObj.qty = dropdownValue;
                      Navigator.pop(context);
                      Navigator.of(context).pushNamed(Routes.cart);
                    });
                  },
                  items: <String>['1', '2', '3', '4', '5', '6', '7', '8']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 12, color: kBlack),
                      ),
                    );
                  }).toList(),
                ),
              );
            }

            return const Text('An error occurred.');
          }),
    );
  }
}
