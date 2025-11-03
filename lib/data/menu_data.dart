import '../models/plat.dart';

/// Liste des catégories disponibles dans le menu
const List<String> categories = [
  'Tous',
  'Favoris',
  'Entrées',
  'Plats',
  'Desserts',
  'Boissons'
];

/// Menu complet du restaurant avec toutes les entrées, plats, desserts et boissons
final List<Plat> menuComplet = [
  // Entrées
  const Plat(
    id: 'entree_1',
    nom: 'Salade César',
    description: 'Salade romaine, poulet grillé, parmesan, croûtons',
    prix: 8.50,
    categorie: 'Entrées',
    imageUrl: 'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=400',
  ),
  const Plat(
    id: 'entree_2',
    nom: 'Soupe à l\'oignon',
    description: 'Gratinée au fromage, servie avec croûtons',
    prix: 6.00,
    categorie: 'Entrées',
    imageUrl: 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=400',
  ),
  const Plat(
    id: 'entree_3',
    nom: 'Carpaccio de bœuf',
    description: 'Fines tranches de bœuf, roquette, parmesan',
    prix: 9.50,
    categorie: 'Entrées',
    imageUrl: 'https://images.unsplash.com/photo-1544025162-d76694265947?w=400',
  ),
  const Plat(
    id: 'entree_4',
    nom: 'Bruschetta',
    description: 'Pain grillé, tomates fraîches, basilic, huile d\'olive',
    prix: 7.00,
    categorie: 'Entrées',
    imageUrl: 'https://images.unsplash.com/photo-1572695157366-5e585ab2b69f?w=400',
  ),
  
  // Plats
  const Plat(
    id: 'plat_1',
    nom: 'Burger Maison',
    description: 'Steak haché 200g, cheddar, bacon, frites maison',
    prix: 15.00,
    categorie: 'Plats',
    imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400',
  ),
  const Plat(
    id: 'plat_2',
    nom: 'Saumon grillé',
    description: 'Pavé de saumon, légumes de saison, sauce citron',
    prix: 18.50,
    categorie: 'Plats',
    imageUrl: 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=400',
  ),
  const Plat(
    id: 'plat_3',
    nom: 'Pasta Carbonara',
    description: 'Pâtes fraîches, lardons, crème, parmesan',
    prix: 12.00,
    categorie: 'Plats',
    imageUrl: 'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=400',
  ),
  const Plat(
    id: 'plat_4',
    nom: 'Pizza Margherita',
    description: 'Tomate, mozzarella, basilic frais',
    prix: 11.00,
    categorie: 'Plats',
    imageUrl: 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=400',
  ),
  const Plat(
    id: 'plat_5',
    nom: 'Steak Frites',
    description: 'Entrecôte 250g, frites maison, sauce au poivre',
    prix: 19.00,
    categorie: 'Plats',
    imageUrl: 'https://images.unsplash.com/photo-1600891964092-4316c288032e?w=400',
  ),
  
  // Desserts
  const Plat(
    id: 'dessert_1',
    nom: 'Tiramisu',
    description: 'Mascarpone, café, cacao',
    prix: 6.50,
    categorie: 'Desserts',
    imageUrl: 'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?w=400',
  ),
  const Plat(
    id: 'dessert_2',
    nom: 'Fondant au chocolat',
    description: 'Coulant au chocolat noir, glace vanille',
    prix: 7.00,
    categorie: 'Desserts',
    imageUrl: 'https://images.unsplash.com/photo-1624353365286-3f8d62daad51?w=400',
  ),
  const Plat(
    id: 'dessert_3',
    nom: 'Tarte aux pommes',
    description: 'Tarte maison, boule de glace vanille',
    prix: 6.00,
    categorie: 'Desserts',
    imageUrl: 'https://images.unsplash.com/photo-1535920527002-b35e96722eb9?w=400',
  ),
  const Plat(
    id: 'dessert_4',
    nom: 'Profiteroles',
    description: 'Choux, glace vanille, sauce chocolat',
    prix: 7.50,
    categorie: 'Desserts',
    imageUrl: 'https://images.unsplash.com/photo-1519915212116-7cfef71f1d3e?w=400',
  ),
  
  // Boissons
  const Plat(
    id: 'boisson_1',
    nom: 'Coca-Cola',
    description: '33cl',
    prix: 3.00,
    categorie: 'Boissons',
    imageUrl: 'https://images.unsplash.com/photo-1554866585-cd94860890b7?w=400',
  ),
  const Plat(
    id: 'boisson_2',
    nom: 'Jus d\'orange',
    description: 'Pressé frais',
    prix: 4.50,
    categorie: 'Boissons',
    imageUrl: 'https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=400',
  ),
  const Plat(
    id: 'boisson_3',
    nom: 'Café',
    description: 'Espresso',
    prix: 2.50,
    categorie: 'Boissons',
    imageUrl: 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=400',
  ),
  const Plat(
    id: 'boisson_4',
    nom: 'Eau minérale',
    description: 'Plate ou gazeuse - 50cl',
    prix: 2.00,
    categorie: 'Boissons',
    imageUrl: 'https://images.unsplash.com/photo-1523362628745-0c100150b504?w=400',
  ),
  const Plat(
    id: 'boisson_5',
    nom: 'Thé glacé',
    description: 'Maison, citron ou pêche',
    prix: 3.50,
    categorie: 'Boissons',
    imageUrl: 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=400',
  ),
  const Plat(
    id: 'boisson_6',
    nom: 'Smoothie fruits rouges',
    description: 'Fraises, framboises, myrtilles',
    prix: 5.00,
    categorie: 'Boissons',
    imageUrl: 'https://images.unsplash.com/photo-1505252585461-04db1eb84625?w=400',
  ),
];