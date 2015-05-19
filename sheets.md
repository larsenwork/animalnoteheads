---
published: true
layout: default
title: Sheets
socialtitle: Animal Note Heads Sheets - fun, free & easy note learning
author: Andreas Larsen
description: Open source multilingual sheet music library, tools to create your own sheet music, iOS app and much more - all free. 
year: 2015
image: AnimalNoteHeadsSocial.png
---
The sheets are sorted by lanuguage. You can request new sheets [here](http://www.reddit.com/r/AnimalNoteHeads/) if you can't find the sheet you're looking for.<br><br>
<table data-sortable>
  <thead>
    <tr>
      <th><h3>English</h3></th>
      <th>Date</th>
      <th>Difficulty</th>
    </tr>
  </thead>
  <tbody>
  {% for post in site.categories.english %}
    <tr>
      <td><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></td>
      <td>{{ post.date | date: "%-d/%-m/%Y" }}</td>
      <td>{{ post.difficulty }}</td>
    </tr>
  {% endfor %}
  </tbody>
</table>
<table data-sortable>
  <tr>
    <td><h3>Français</h3></td>
    <td>Date</td>
    <td>Difficulty</td>
  </tr>
  {% for post in site.categories.french %}
    <tr>
      <td><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></td>
      <td>{{ post.date | date: "%-d/%-m/%Y" }}</td>
      <td>{{ post.difficulty }}</td>
    </tr>
  {% endfor %}
</table>

### License
© 2015 Andreas Larsen. The sheets are [CC-BY-ND-4.0](https://creativecommons.org/licenses/by-nd/4.0/).