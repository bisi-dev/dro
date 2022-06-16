import 'package:dro/core/app_export.dart';

class AltAppBar extends StatelessWidget {
  final String? title;

  const AltAppBar({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kScreenHeight(context) * 0.15,
      decoration: const BoxDecoration(
        color: kPurple,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(kLargeRadius),
          bottomRight: Radius.circular(kLargeRadius),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              child: Image.asset(
                AssetsImages.appBarFig,
                fit: BoxFit.cover,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(kLargeRadius),
                  bottomRight: Radius.circular(kLargeRadius),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: kPaddingM),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: kWhite,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(kPaddingS),
                    child: Text(
                      '$title',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: kWhite,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed(Routes.cart),
                  child: Padding(
                    padding: const EdgeInsets.all(kPaddingM),
                    child: Badge(
                      badgeColor: Colors.yellow,
                      elevation: 0,
                      position: BadgePosition.topEnd(top: 0, end: 0),
                      child: ConstrainedBox(
                        constraints:
                            const BoxConstraints(maxHeight: 40, maxWidth: 40),
                        child: const Icon(Icons.shopping_cart_outlined,
                            color: kWhite),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
