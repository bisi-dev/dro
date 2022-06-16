import 'package:dro/core/app_export.dart';
import 'package:dro/data/data_export.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AltAppBar(
              title: 'Categories',
            ),
            Container(
              color: kWhite,
              height: kScreenHeight(context) * 0.85,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: mainCategoryData
                      .map(
                        (category) => InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                Routes.categoryDetails,
                                arguments: category.title!);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(category.imageUri!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  category.title!,
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
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
