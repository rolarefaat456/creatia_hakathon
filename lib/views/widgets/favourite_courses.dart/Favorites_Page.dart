import 'package:flutter/material.dart';
import 'package:hacathon_app/components/widgets/course_section.dart';
import 'package:hacathon_app/components/widgets/section_name.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/generated/l10n.dart';
import 'package:hacathon_app/providers/control.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Consumer<Control>(
        builder: (context, value, child) {
          return Column(
            children: [
              SectionName(name: S.of(context).favorites_title,),
              Expanded(
                child: (value.allFavorite == null ||
              value.allFavorite['data'] == null ||
              value.allFavorite['data'].isEmpty) ? Center(child: Text(S.of(context).no_favorites)): value.isLoading
              ? CircularProgressIndicator()
              : CourseSection(name: S.of(context).booking_date, fontfamily: 'VEXA', source: 'Favorite',)
            ),
            ],
          );
        }
      ),
    );
  }
}
