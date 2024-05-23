import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/provider/global_provider.dart';
import '../../common/utils/data_utils.dart';
import '../model/rating_model.dart';

class RatingContainer extends ConsumerWidget {
  const RatingContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ratings = ref.watch(ratingProvider);
    final isSelected = ref.watch(isSelectedRating);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '최근 리뷰 5건',
                style: MyTextStyle.bigTitleMedium,
              ),
              IconButton(
                onPressed: () {
                  ref.read(isSelectedRating.notifier).state = !isSelected;
                },
                icon: isSelected
                    ? PhosphorIcon(
                        PhosphorIcons.caretDown(),
                        size: 32.0,
                      )
                    : PhosphorIcon(
                        PhosphorIcons.caretUp(),
                        size: 32.0,
                      ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          if (isSelected)
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final rating = ratings[index];

                return RatingCard(rating: rating);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 8.0);
              },
              itemCount: 5,
            ),
        ],
      ),
    );
  }
}

class RatingCard extends StatelessWidget {
  final RatingModel rating;

  const RatingCard({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: MyColor.middleGrey,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  rating.username,
                  style: MyTextStyle.bodyTitleRegular,
                ),
                Row(
                  children: [
                    PhosphorIcon(
                      PhosphorIcons.star(PhosphorIconsStyle.fill),
                      size: 24.0,
                      color: MyColor.primary,
                    ),
                    const SizedBox(width: 6.0),
                    Text(
                      rating.ratingPoint.toString(),
                      style: MyTextStyle.bodyTitleRegular.copyWith(
                        color: MyColor.primary,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 4.0),
            Text(
              DataUtils.convertDateTimeToDateString(datetime: rating.createAt),
              style: MyTextStyle.descriptionRegular.copyWith(
                color: MyColor.darkGrey,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              rating.content,
              style: MyTextStyle.descriptionRegular,
            ),
          ],
        ),
      ),
    );
  }
}
