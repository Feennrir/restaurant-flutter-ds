import 'package:flutter/material.dart';
import '../models/plat.dart';

/// Widget représentant une carte de plat dans la liste
class PlatCard extends StatelessWidget {
  final Plat plat;
  final bool estFavori;
  final VoidCallback onTap;
  final VoidCallback onToggleFavori;

  const PlatCard({
    super.key,
    required this.plat,
    required this.estFavori,
    required this.onTap,
    required this.onToggleFavori,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      elevation: 3,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.grey.shade50,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image du plat avec badge favori
                Stack(
                  children: [
                    _buildPlatImage(),
                    // Badge favori sur l'image
                    Positioned(
                      top: -4,
                      right: -4,
                      child: _buildFavoriteButton(),
                    ),
                  ],
                ),
                
                const SizedBox(width: 14),
                
                // Informations du plat
                Expanded(
                  child: _buildPlatInfo(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Bouton favori avec animation
  Widget _buildFavoriteButton() {
    return IconButton(
      icon: Icon(
        estFavori ? Icons.favorite : Icons.favorite_border,
        color: estFavori ? Colors.red : Colors.grey.shade400,
        size: 24,
      ),
      onPressed: onToggleFavori,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      style: IconButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(6),
        shape: const CircleBorder(),
      ),
    );
  }

  /// Construit l'image du plat avec style moderne
  Widget _buildPlatImage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE67E22).withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          plat.imageUrl,
          width: 90,
          height: 90,
          fit: BoxFit.cover,
          // Placeholder pendant le chargement avec dégradé
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFE67E22).withOpacity(0.2),
                    const Color(0xFFD35400).withOpacity(0.2),
                  ],
                ),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFE67E22)),
                ),
              ),
            );
          },
          // Image de secours avec icône colorée
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFE67E22).withOpacity(0.2),
                    const Color(0xFFD35400).withOpacity(0.2),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.restaurant_menu,
                size: 45,
                color: Color(0xFFE67E22),
              ),
            );
          },
        ),
      ),
    );
  }

  /// Construit la section d'informations du plat
  Widget _buildPlatInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Nom du plat avec style élégant
        Text(
          plat.nom,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50), // Bleu foncé
            letterSpacing: 0.3,
          ),
        ),
        
        const SizedBox(height: 6),
        
        // Description du plat avec couleur douce
        Text(
          plat.description,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[700],
            height: 1.4,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        
        const SizedBox(height: 10),
        
        // Prix et badge de catégorie
        _buildPriceAndCategory(),
      ],
    );
  }

  /// Construit la ligne affichant le prix et le badge de catégorie
  Widget _buildPriceAndCategory() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Prix avec dégradé de texte simulé
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFE67E22),
                Color(0xFFD35400),
              ],
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFE67E22).withOpacity(0.3),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            '${plat.prix.toStringAsFixed(2)} €',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
        ),
        
        // Badge de catégorie avec bordure colorée
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF5E6), // Beige très clair
            border: Border.all(
              color: const Color(0xFFE67E22).withOpacity(0.3),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            plat.categorie,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFFD35400), // Orange foncé
              letterSpacing: 0.3,
            ),
          ),
        ),
      ],
    );
  }
}