---
layout: page
permalink: /publications/
title: Research
description: 
years: [2022, 2021]
nav: true
nav_order: 1
---

### Disciplinary identifications
As a linguistic anthropologist, I aspire to gain a deeper understanding of the ways in which language functions in interrelation with social and cultural practices like identifications, processes of inclusion and exclusion, social differentiation, and the construction of belonging. Therefore, I study language use as it unfolds in interrelation with language policies and ideologies. I approach these complex phenomena through the lens of situated interaction in real-life contexts and ground my work in linguistic ethnography. In order to better understand how people give meaning to their practices and lifeworlds, I engage with my research participants in the contexts of their daily life over time in the scope of linguistic ethnographic fieldwork. While I conduct participant observation, sometimes in combination with audio-/video-recordings, and interviews, I build rapport with my participants and become part of the settings I am researching. In my scholarly practice, I strive to learn from these experiences and reflexively integrate them into my analysis whenever fruitful.

### Research theme
The underlying theme of my research is the broad interest in the processes through which novices become part of communities or not, mediated through language practices. In this context, I am particularly interested in participatory processes in educational settings. Educational institutions commonly act upon hierarchical orderings of language which are also represented in society, and they simultaneously contribute to the spread of (often dominant) language ideologies in turn, making these highly relevant research fields. My research thus far is mainly concerned with two different groups of novices: Children and Second Language Learners. These two groups are united by their emergent interactional repertoire and their position as relatively new members of society, either as (recently) born into it or as newcomers and/or in the position of language learners of the national language.

### Publications

<!-- _pages/publications.md -->

<div class="publications">

{%- for y in page.years %}

<h2 class="year">{{y}}</h2>
  {% bibliography -f papers -q @*[year={{y}}]* %}
{% endfor %}

</div>
