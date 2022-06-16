import 'package:dro/core/app_export.dart';
import 'package:dro/data/data_export.dart';

class Pharmacy extends StatefulWidget {
  const Pharmacy({Key? key}) : super(key: key);

  @override
  State<Pharmacy> createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy> {
  final TextEditingController _controller = TextEditingController();
  final List<Suggestions> _searchResult = [];

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    for (var suggestion in suggestionsData) {
      if (suggestion.title.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(suggestion);
      }
    }
    setState(() {});
  }

  List<Container> suggestionCardList(
      BuildContext ctx, List<Suggestions> suggestions) {
    return _searchResult.isNotEmpty || _controller.text.isNotEmpty
        ? _searchResult.map((suggestion) {
            return Container(
              margin: const EdgeInsets.all(kPaddingS),
              child: suggestionCard(ctx, suggestion),
            );
          }).toList()
        : suggestionsData.map((suggestion) {
            return Container(
              margin: const EdgeInsets.all(kPaddingS),
              child: suggestionCard(ctx, suggestion),
            );
          }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTintedWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: kScreenHeight(context) * 0.20,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(kPaddingM),
                          child: Text(
                            'Pharmacy',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: kWhite,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        InkWell(
                          onTap: () =>
                              Navigator.of(context).pushNamed(Routes.cart),
                          child: Padding(
                            padding: const EdgeInsets.all(kPaddingM),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                  maxHeight: 40, maxWidth: 40),
                              child: Image.asset(AssetsImages.delivery),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kPaddingS, horizontal: kPaddingM),
                      child: buildFloatingSearchBar(context),
                    ),
                  ),
                ],
              ),
            ),
            (_controller.text.isNotEmpty && _searchResult.isEmpty)
                ? Container()
                : Container(
                    color: kTintedWhite,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kPaddingS, horizontal: kPaddingM),
                      child: Row(
                        children: [
                          const Icon(Icons.room_outlined),
                          RichText(
                            text: TextSpan(
                              text: 'Delivery in ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 16,
                                  ),
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'Lagos, ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                TextSpan(
                                    text: 'NG',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            (_controller.text.isNotEmpty && _searchResult.isEmpty)
                ? Container()
                : (_searchResult.isNotEmpty)
                    ? Container()
                    : Container(
                        color: kWhite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: kPaddingSx),
                              child: Text(
                                'CATEGORIES',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: kGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: kPaddingS),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(Routes.categories);
                                  },
                                  child: Text(
                                    'VIEW ALL',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                          color: kPurple,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  style: TextButton.styleFrom(
                                      fixedSize: Size.infinite),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
            (_controller.text.isNotEmpty && _searchResult.isEmpty)
                ? Container()
                : (_searchResult.isNotEmpty)
                    ? Container()
                    : Container(
                        color: kWhite,
                        height: kScreenHeight(context) * 0.15,
                        child: ListView.builder(
                          itemBuilder: (ctx, index) => InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  Routes.categoryDetails,
                                  arguments:
                                      categoriesData[index].toJson()['title']);
                            },
                            child: Container(
                              height: kScreenHeight(context) * 0.15,
                              width: kScreenHeight(context) * 0.15,
                              margin: EdgeInsets.only(
                                  left: kPaddingSx,
                                  right: index == 3 ? kPaddingSx : 0.0),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset(
                                    categoriesData[index].toJson()['imageUri'],
                                    alignment: Alignment.center,
                                    height: double.infinity,
                                    width: double.infinity,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Text(
                                        categoriesData[index].toJson()['title'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                              color: kWhite,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                        ),
                      ),
            (_controller.text.isNotEmpty && _searchResult.isEmpty)
                ? Container()
                : (_searchResult.isNotEmpty)
                    ? Container()
                    : Container(
                        width: kScreenWidth(context),
                        decoration: const BoxDecoration(color: kWhite),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kPaddingSx),
                          child: Text(
                            'SUGGESTIONS',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: kGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                          ),
                        ),
                      ),
        (_controller.text.isNotEmpty && _searchResult.isEmpty)
        ? Container(
          color: kWhite,
          height: kScreenHeight(context) * 1.0,
          child: Center(
            child: Column(
              children: [
                Flexible(
                  child: SizedBox.expand(
                    child: Image.asset(AssetsImages.noResultSearch),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(kPaddingSx),
                    child: Text(
                      'No search result for "${_controller.text}"',
                      style: const TextStyle(color: kGrey),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
        : Container(
              color: kWhite,
              height: kScreenHeight(context) * 0.467,
              child:BlocBuilder<CatalogBloc, CatalogState>(
                      builder: (context, state) {
                        if (state is CatalogLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state is CatalogLoaded) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kPaddingS),
                            child: GridView.count(
                              padding: const EdgeInsets.all(0.0),
                              crossAxisCount: 2,
                              children: suggestionCardList(
                                  context, state.catalog.itemNames),
                            ),
                          );
                        }

                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(kPaddingS),
                            child: Text(
                              'Something went wrong.',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: kBlack,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget suggestionCard(BuildContext ctx, Suggestions suggestion) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.productDetails, arguments: {
          'title': suggestion.title,
          'imageUri': suggestion.imageUri,
          'type': suggestion.drugType,
          'weight': suggestion.weight,
          'price': suggestion.price,
          'qty': suggestion.qty,
          'requiresPrescription': suggestion.requiresPrescription,
        });
      },
      child: PhysicalModel(
        color: kWhite,
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        shadowColor: kGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: AssetImage(suggestion.imageUri),
                          fit: BoxFit.fill),
                    ),
                  ),
                  if (suggestion.requiresPrescription)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: kScreenWidth(ctx),
                        color: Colors.black26,
                        child: const Text(
                          'Requires a prescription',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: kWhite),
                        ),
                      ),
                    )
                ],
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
                        suggestion.title,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text('${suggestion.drugType} • ' '${suggestion.weight}mg'),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '₦${suggestion.price}',
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
    );
  }

  Widget buildFloatingSearchBar(BuildContext context) {
    return Container(
      width: kScreenWidth(context),
      padding: const EdgeInsets.all(kPaddingS),
      decoration: const BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(Radius.circular(kSmallRadius)),
      ),
      child: TextField(
        controller: _controller,
        onChanged: onSearchTextChanged,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.search,
            color: kWhite,
          ),
          labelText: _controller.text.isEmpty ? 'Search' : ' ',
          contentPadding: const EdgeInsets.symmetric(vertical: kPaddingS),
          labelStyle: const TextStyle(
            color: kWhite,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        cursorColor: kWhite,
        style: const TextStyle(color: kWhite),
      ),
      height: kScreenHeight(context) * 0.057,
    );
  }
}
