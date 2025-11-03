import 'package:flutter/material.dart';
import 'models/plat.dart';
import 'widgets/category_filter.dart';
import 'widgets/plat_card.dart';
import 'widgets/plat_detail_page.dart';
import 'data/menu_data.dart';

void main() {
  runApp(const RestaurantMenuApp());
}

/// Widget principal de l'application
class RestaurantMenuApp extends StatelessWidget {
  const RestaurantMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Restaurant',
      theme: ThemeData(
        // Palette de couleurs moderne : tons chauds et élégants
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE67E22), // Orange brûlé
          primary: const Color(0xFFE67E22),
          secondary: const Color(0xFF34495E), // Bleu grisâtre
          surface: Colors.white,
          background: const Color(0xFFF5F6FA), // Gris très clair
        ),
        useMaterial3: true,
        // AppBar avec fond dégradé
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xFFE67E22),
          foregroundColor: Colors.white,
        ),
      ),
      home: const MenuPage(),
    );
  }
}

/// Page principale du menu avec système de filtrage et gestion des favoris
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // Catégorie sélectionnée par défaut
  String categorieSelectionnee = 'Tous';
  
  // Set des IDs des plats favoris
  final Set<String> _favoris = {};

  /// Filtre les plats selon la catégorie sélectionnée
  List<Plat> get platsFiltres {
    if (categorieSelectionnee == 'Favoris') {
      return menuComplet.where((plat) => _favoris.contains(plat.id)).toList();
    }
    if (categorieSelectionnee == 'Tous') {
      return menuComplet;
    }
    return menuComplet
        .where((plat) => plat.categorie == categorieSelectionnee)
        .toList();
  }

  /// Callback appelé lors de la sélection d'une catégorie
  void _onCategorieSelectionnee(String categorie) {
    setState(() {
      categorieSelectionnee = categorie;
    });
  }

  /// Toggle le statut favori d'un plat
  void _toggleFavori(String platId) {
    setState(() {
      if (_favoris.contains(platId)) {
        _favoris.remove(platId);
      } else {
        _favoris.add(platId);
      }
    });
  }

  /// Vérifie si un plat est en favori
  bool _estFavori(String platId) {
    return _favoris.contains(platId);
  }

  /// Ouvre la page de détail d'un plat
  void _ouvrirDetailPlat(Plat plat) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlatDetailPage(
          plat: plat,
          estFavori: _estFavori(plat.id),
          onToggleFavori: () => _toggleFavori(plat.id),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fond de couleur douce
      backgroundColor: const Color(0xFFF5F6FA),
      
      // En-tête de l'application avec dégradé
      appBar: AppBar(
        title: const Text(
          '🍽️ Menu du Restaurant',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 0.5,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFE67E22), // Orange brûlé
                Color(0xFFD35400), // Orange foncé
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          // Badge du nombre de favoris
          if (_favoris.isNotEmpty)
            Center(
              child: Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.favorite, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      '${_favoris.length}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      
      body: Column(
        children: [
          // Barre de filtres par catégories
          CategoryFilter(
            categories: categories,
            categorieSelectionnee: categorieSelectionnee,
            onCategorieSelectionnee: _onCategorieSelectionnee,
          ),

          // Divider subtil avec ombre
          Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.grey.shade300,
                  Colors.transparent,
                ],
              ),
            ),
          ),

          // Liste des plats filtrés
          Expanded(
            child: _buildPlatsList(),
          ),
        ],
      ),
    );
  }

  /// Construit la liste des plats ou affiche un message si vide
  Widget _buildPlatsList() {
    if (platsFiltres.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              categorieSelectionnee == 'Favoris' 
                  ? Icons.favorite_border 
                  : Icons.search_off,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              categorieSelectionnee == 'Favoris'
                  ? 'Aucun plat en favori'
                  : 'Aucun plat dans cette catégorie',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (categorieSelectionnee == 'Favoris')
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Ajoutez des plats en favoris en cliquant sur ❤️',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12.0),
      itemCount: platsFiltres.length,
      itemBuilder: (context, index) {
        final plat = platsFiltres[index];
        // Correction: ajout de tous les paramètres requis
        return PlatCard(
          plat: plat,
          estFavori: _estFavori(plat.id),
          onTap: () => _ouvrirDetailPlat(plat),
          onToggleFavori: () => _toggleFavori(plat.id),
        );
      },
    );
  }
}
