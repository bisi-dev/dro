import 'package:dro/core/app_export.dart';
import 'package:dro/data/data_export.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AltAppBar(title: 'Categories',),
            Container(
              color: kWhite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(kPaddingSx),
                    child: Text(
                      'CATEGORIES',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
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
            Container(
              color: kWhite,
              height: kScreenHeight(context) * 0.13,
              child: ListView.builder(
                itemBuilder: (ctx, index) => InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context)
                        .pushNamed(Routes.categoryDetails, arguments: categoriesData[index].toJson()['title']);
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
            Container(
              width: kScreenWidth(context),
              decoration: const BoxDecoration(color: kWhite),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kPaddingSx),
                child: Text(
                  title.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: kGrey,
                        fontWeight: FontWeight.bold,
                    fontSize: 16,
                      ),
                ),
              ),
            ),
            Container(
              color: kWhite,
              height: kScreenHeight(context) * 0.64,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kPaddingS),
                child: GridView.count(
                  padding: const EdgeInsets.all(0.0),
                  crossAxisCount: 2,
                  children: _buildSuggestions(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Container> _buildSuggestions(BuildContext ctx) {
    return suggestionsData.map((suggestion) {
      return Container(
        margin: const EdgeInsets.all(kPaddingS),
        child: _aSingleSuggestion(ctx, suggestion),
      );
    }).toList();
  }

  Widget _aSingleSuggestion(BuildContext ctx, Suggestions suggestion) {
    return InkWell(
      onTap: () {
        Navigator.of(ctx).pushNamed(Routes.productDetails, arguments: {
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
                          fit: BoxFit.fill
                      ),
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
                      child: Text(suggestion.title, style: const TextStyle(fontWeight: FontWeight.w500)),
                    ),
                    Text('${suggestion.drugType} • ' '${suggestion.weight}mg'),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '₦${suggestion.price}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
}
