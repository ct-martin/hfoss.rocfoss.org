---
layout: page
title: Participants
---
{% assign semlist = "" %}
{% for post in site.posts %}
{% assign sem = post.categories | join: "/" %}
{% if post.categories.first == "people" %}
{% assign semlist = semlist | append: "|" | append: sem %}
{% endif %}
{% endfor %}

{% assign list = semlist | remove_first: "|" | remove: "people/" | split: "|" | uniq | sort %}

<ul class="nav nav-pills mb-3" id="semlist-tab" role="tablist">
{% for i in list %}
{% if i == site.current_semester %}
{% assign active = " active" %}
{% assign selected = "true" %}
{% else %}
{% assign active = "" %}
{% assign selected = "false" %}
{% endif %}
{% assign id = i | replace: "/", "-" %}
    <li class="nav-item">
        <a
            class="nav-link{{active}}"
            id="semlist-{{id}}-tab"
            data-toggle="pill"
            href="#semlist-{{id}}"
            role="tab"
            aria-controls="semlist-{{id}}"
            aria-selected="{{selected}}"
        >
            {{ i }}
        </a>
    </li>
{% endfor %}
</ul>

<div class="tab-content" id="semlist-tabContent">
{% for i in list %}
{% if i == site.current_semester %}
{% assign active = " show active" %}
{% else %}
{% assign active = "" %}
{% endif %}
{% assign id = i | replace: "/", "-" %}
    <div
        class="tab-pane fade{{active}}"
        id="semlist-{{id}}"
        role="tabpanel"
        aria-labelledby="semlist-{{id}}-tab"
    >
        {% for post in site.posts %}
            {% if post.categories.first == "people" %}
            {% assign sem = post.categories | join: "/" | remove: "people/" %}
            {% if sem == i %}
                <p><a href="{{ post.url }}">{{ post.name }}</a></p>
            {% endif %}
            {% endif %}
        {% endfor %}
    </div>
{% endfor %}
</div>