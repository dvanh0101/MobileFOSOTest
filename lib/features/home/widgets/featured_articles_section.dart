import 'package:flutter/material.dart';

import '../../../models/product_item.dart';
import '../../../shared/widgets/article_tile.dart';
import '../../../shared/widgets/section_header.dart';

class FeaturedArticlesSection extends StatelessWidget {
  const FeaturedArticlesSection({
    super.key,
    required this.articles,
    this.onSeeAll,
    this.onArticleTap,
  });

  final List<ArticleItem> articles;
  final VoidCallback? onSeeAll;
  final ValueChanged<ArticleItem>? onArticleTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Bài Viết Nổi Bật',
          icon: Icons.article_rounded,
          onSeeAll: onSeeAll,
        ),
        const SizedBox(height: 8),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: articles.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (_, i) => ArticleTile(
            article: articles[i],
            onTap: () => onArticleTap?.call(articles[i]),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
