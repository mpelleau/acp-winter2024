---
layout: page
show_meta: false
permalink: team/
title: Comités
published: true
---

{% for comite in site.data.comites %}
## Comité {{ comite.type }}

### Présidence
{% include list_members members = comite.presidence %}

### Autre Membres
{% include list_members members = comite.autre %}

{% endfor %}
