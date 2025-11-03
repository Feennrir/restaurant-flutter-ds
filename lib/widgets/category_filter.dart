import 'package:flutter/material.dart';

/// Widget affichant la barre de filtres de catégories horizontale
class CategoryFilter extends StatelessWidget {
  final List<String> categories;
  final String categorieSelectionnee;
  final Function(String) onCategorieSelectionnee;

  const CategoryFilter({
    super.key,
    required this.categories,
    required this.categorieSelectionnee,
    required this.onCategorieSelectionnee,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final categorie = categories[index];
          final estSelectionne = categorieSelectionnee == categorie;
          
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: _buildFilterChip(categorie, estSelectionne),
          );
        },
      ),
    );
  }

  /// Construit un chip de filtre pour une catégorie avec style moderne
  Widget _buildFilterChip(String categorie, bool estSelectionne) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: FilterChip(
        label: Text(categorie),
        selected: estSelectionne,
        onSelected: (selected) => onCategorieSelectionnee(categorie),
        // Couleurs non sélectionnées : tons neutres
        backgroundColor: const Color(0xFFF5F6FA),
        // Couleurs sélectionnées : dégradé orange/rouge élégant
        selectedColor: const Color(0xFFE67E22),
        checkmarkColor: Colors.white,
        elevation: estSelectionne ? 4 : 0,
        shadowColor: const Color(0xFFE67E22).withOpacity(0.3),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        labelStyle: TextStyle(
          color: estSelectionne ? Colors.white : const Color(0xFF34495E),
          fontWeight: estSelectionne ? FontWeight.bold : FontWeight.w600,
          fontSize: 14,
          letterSpacing: 0.3,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: estSelectionne 
                ? const Color(0xFFE67E22) 
                : Colors.grey.shade300,
            width: estSelectionne ? 0 : 1,
          ),
        ),
      ),
    );
  }
}