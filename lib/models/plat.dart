/// Modèle de données représentant un plat du menu
class Plat {
  final String id;
  final String nom;
  final String description;
  final double prix;
  final String categorie;
  final String imageUrl;

  const Plat({
    required this.id,
    required this.nom,
    required this.description,
    required this.prix,
    required this.categorie,
    required this.imageUrl,
  });
}