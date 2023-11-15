# Site pour l'ACP Winter school

## Génération du site

Pour générer le site, il faut avoir ruby, bundle et jekyll d'installé sur sa machine.

Une fois le dépot git récupéré, il faut la première fois faire
```
bundle install
```

qui va installer les plugins nécessaires pour le site.

Pour générer le site il faut faire
```
bundle exec jekyll serve --config _config.yml,_config_dev.yml
```

qui va générer le site (dans le dossier `_site` par défaut) et faire un serveur local afin de pouvoir voir le site à l'adresse [http://localhost:4000](http://localhost:4000).

## Types de pages

Il y a 4 types de pages possibles et se trouvent dans le dossier `_layout/` :

- pour les pages d'accueil `_layout/home.html`
- pour les pages " normales " `_layout/page.html`
- pour les pages avec une image en entête `_layout/page-image.html`
- pour les pages vides sans barre de navigation `_layout/page-empty.html`

## Description des fichiers

- la page d'accueil `index.html`,
- le programme détaillé avec les dates importantes `_pages/agenda.md`,
- les informations et tarifs pour les inscirptions `_pages/inscription.md`,
- les sponsors `_pages/sponsors.md`,
- des informations sur l'école `_pages/about.md`,
- et des informations sur Aussois et le Centre Paul Langevin `_pages/venue.md`.

Certaines de ces pages ou parties de page sont générées automatiquement à partir de fichiers de données.
Les fichiers de données se trouvent dans le dossier `_data`.

- `inscription.yml` contient les champs du formulaire d'inscription ;
- `navigation.yml` contient les éléments que l'on souhaite voir apparaître dans la barre de navigation ;
- `programme.yml` contient le programme détaillé ;
- `speakers.yml` contient des informations sur les conférenciers invités qui figureront sur la page d'accueil ;
- `sponsors.yml` contient des informations sur les sponsors.

| Page                    | Générée totalement ou en partie à partir de |
|-------------------------|---------------------------------------------|
| `_layout/home.md`       | `_data/speakers.yml`, `_data/sponsors.yml`  |
| `_pages/agenda.md`      | `_data/programme.yml`                       |
| `_pages/inscription.md` | `_data/inscription.yml`                     |
| `_pages/speakers.md`    | `_data/speakers.yml`                        |
| `_pages/sponsors.md`    | `_data/sponsors.yml`                        |
