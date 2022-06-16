import 'package:dro/core/app_export.dart';
import 'package:dro/data/data_export.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CartLoading) {
            return const SizedBox();
          }
          if (state is CartLoaded) {
            return Padding(
              padding: const EdgeInsets.only(bottom: kPaddingM),
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.cart);
                },
                backgroundColor: kTransparent,
                elevation: 0,
                label: PhysicalModel(
                  color: kTransparent,
                  shadowColor: kRedGradientRight,
                  elevation: 15.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(kLargeRadius + 50)),
                      border: Border.all(color: kWhite, width: 3.5),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [
                          0.6,
                          1
                        ], // 10% of the width, so there are ten blinds.
                        colors: <Color>[
                          kRedGradientRight,
                          kRedGradientLeft,
                        ], // red to yellow// repeats the gradient over the canvas
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(kPaddingS),
                          child: Text(
                            'Checkout',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: kWhite,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        const Icon(Icons.shopping_cart_outlined),
                        Container(
                          decoration: const BoxDecoration(
                            color: kYellow,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: kPaddingS, right: kPaddingS),
                            child: Text(
                              state.cart.items.length.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: kBlack,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const Text('Something occurred');
        });
  }
}
