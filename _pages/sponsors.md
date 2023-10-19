---
layout: page
show_meta: false
permalink: sponsors/
title: Sponsors
published: true
---

{% for sponsor in site.data.sponsors -%}
  - {: class="col-sm-3"}[![{{ sponsor.name }}]({{ site.url }}{{ site.baseurl }}/images/sponsors/{{ sponsor.img }}){: class="sponsor-img  img-centered" style="{{ sponsor.style }}"}]({{ sponsor.website }}){: target="_blank"}
{% endfor %}{: class="sponsors"}