import 'package:flutter/material.dart';
import 'package:hacathon_app/components/jointed_widgets/course_section.dart';
import 'package:hacathon_app/components/jointed_widgets/section_name.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
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
              SectionName(name: 'الدورات المفضلة',),
              Expanded(
                child: (value.allFavorite == null ||
              value.allFavorite['data'] == null ||
              value.allFavorite['data'].isEmpty) ? Center(child: Text("No Favorites available")): value.isLoading
              ? CircularProgressIndicator()
              : CourseSection(name: 'الحجز : 1 أغسطس 2025', fontfamily: 'VEXA', source: 'Favorite',)
            ),
            ],
          );
        }
      ),
    );
  }
}
