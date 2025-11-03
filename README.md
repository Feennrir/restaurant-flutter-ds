# 🍽️ Menu Restaurant - Application Flutter

Une application mobile élégante pour consulter le menu d'un restaurant avec système de favoris et vue détaillée des plats.

## ✨ Fonctionnalités

- **Menu complet** : Consultation de tous les plats organisés par catégories (Entrées, Plats, Desserts, Boissons)
- **Filtrage par catégorie** : Navigation facile entre les différentes catégories
- **Système de favoris** : Possibilité de sauvegarder ses plats préférés
- **Vue détaillée** : Affichage complet des informations de chaque plat (description, prix, image)

## 📸 Video
![Menu Restaurant Demo](./DS3_nathan_boileau.mov)

## 🏗️ Structure du projet

```
lib/
├── main.dart                    # Point d'entrée et page principale
├── models/
│   └── plat.dart               # Modèle de données pour un plat
├── data/
│   └── menu_data.dart          # Données du menu (plats et catégories)
└── widgets/
    ├── category_filter.dart     # Barre de filtres horizontale
    ├── plat_card.dart          # Carte d'affichage d'un plat
    └── plat_detail_page.dart   # Page de détail d'un plat
```

## 🚀 Installation

1. Cloner le repository
```bash
git clone [url-du-repo]
cd ds3
```

2. Installer les dépendances
```bash
flutter pub get
```

3. Lancer l'application
```bash
flutter run
```

## 📝 Licence

Projet académique - ESGI M2 Flutter


## Auteur
- Nathan Boileau - Étudiant en M2 à l'ESGI