---
layout: page
show_meta: false
permalink: prix/
title: Prix Jeune Chercheur
published: true
---

<!-- Ajouter lien dans le programme et la navigation (?) -->

Durant cette édition des JFPC, quatre sessions seront consacrées aux présentations faites par de « jeunes chercheurs ».

À l'issue de la conférence, un prix sera remis par l'organisation afin de récompenser la présentation qui aura été jugée la plus pertinente par les participants de la conférence.
Ce prix de 400 € permettra à l'heureux lauréat de se déplacer, dans un délai de deux ans, sur un évènement scientifique de son choix (conférence ou école d'été).

<!-- #### Lauréat du prix jeune chercheur -->

**Mathieu Vavrille est lauréat du prix Jeune Chercheur des JFPC 2021 après le vote d'une quarantaine de participants.**

[Tirage de solutions par ajout de contraintes tables aléatoires]({% include link-asset asset="JFPC_2021_F4.pdf" %}) Par Mathieu Vavrille,  Charlotte Truchet, Charles Prud’homme.
<br/>
**Résumé.** Les solveurs de contraintes actuels mettent à disposition des utilisateurs des algorithmes efficaces pour traiter les problèmes de satisfaction et d’optimisation combinatoires.
Ceux-ci sont inadaptées à de nouveaux usages, comme celui du tirage aléatoire de solutions.
Nous proposons ici un algorithme pour tirer des solutions aléatoirement, se basant sur l’ajout de contraintes tables générées aléatoirement, sans modifier le modèle du problème.
Nous avons implémenté cette méthode de résolution en utilisant un solveur de contraintes existant.
Nos expériences montrent que cet algorithme est une amélioration par rapport à une stratégie de branchement aléatoire en terme de qualité de l’aléatoire du tirage.

#### Mode de scrutin
Le prix du jeune chercheur sera attribué par un vote par élimination successive.<br/>
Dans ce mode de scrutin, on demande aux électeurs de choisir au plus 3 candidats et de les classer selon leur ordre de préférence.


Le vote d'un électeur est d'abord attribué au premier des candidats de sa liste.
S'il est le candidat qui a obtenu le moins de voix, il est éliminé et le vote est donné au candidat classé deuxième sur la liste de l'électeur.
Le processus d'élimination se poursuit jusqu'à ce qu'il ne reste plus qu'un seul candidat, le vainqueur.

##### Plus d'information sur le mode de scrutin

- [Wikipedia](https://en.wikipedia.org/wiki/Instant-runoff_voting)
- [Votez Autrement - Présidentielles 2017](https://vote.imag.fr/)
- Système de votes pour les JFPC 2021 : [code source du script R]({% include link-asset asset="InstantRunoffVoting.R" %}) +  [code source des tests]({% include link-asset asset="TestInstantRunoffVoting.R" %}) +


<!-- #### Instructions de vote -->

<!-- - Vous devez remplir le formulaire en indiquant l'adresse utilisée pour l'inscription aux JFPC 2021. -->
<!-- - Dans un bulletin, les votes multiples pour un même article ne seront pas pris en compte. -->
<!-- - La date limite pour le vote est le jeudi 24 juin à 16h45. -->


<!-- <a class="btn btn-xl" href="https://docs.google.com/forms/d/e/1FAIpQLSeeOQuEbyIVT1dpxdZzQpe5Z0SE68uG5d0ntRY4KXHLUuHVBQ/viewform?usp=sf_link">VOTEZ ICI</a> -->
