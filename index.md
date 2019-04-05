---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
title: Home
---
# HFOSS

_The RIT Humanitarian Free/Open Source Software Development Course_

*    2018-01-17 — 2018-04-30
*    Mon,Wed,Fri 9:00AM - 9:55AM
*    IGME582.01.2175
*    Golisano Hall (GOL)-2350
*    deejoe@mail.rit.edu


{% for post in site.posts %}

## [{{ post.title }}]({{ post.url }})
> {{ post.excerpt }}

{% endfor %}
