import 'package:fintech_app/features/portfolio/data/models/portfolio_asset_model.dart';
import 'package:fintech_app/features/portfolio/presentation/widgets/portfolio_asset_item.dart';
import 'package:flutter/material.dart';

class PortfolioList extends StatelessWidget {
  final List<PortfolioAssetModel> assets;

  const PortfolioList({super.key, required this.assets});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final asset = assets[index];
          return PortfolioAssetItem(asset: asset);
        },
        childCount: assets.length,
      ),
    );
  }
}
