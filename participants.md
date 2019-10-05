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
        <div class="row">
        {% assign allposts = site.posts | reverse %}
        {% for post in allposts %}
            {% if post.categories.first == "people" %}
            {% assign sem = post.categories | join: "/" | remove: "people/" %}
            {% if sem == i %}
            <div class="col-12 col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><a href="{{ post.url }}">{{ post.name }}</a></h5>
                        <p class="card-text"><strong>Homework ({{ post.hw.size }}):</strong></p>
                        <ul>
                            {% for hw in post.hw %}
                            <li><a href="{{ hw[1] }}">{{ hw[0] }}</a></li>
                            {% endfor %}
                        </ul>
                    </div>
                </div>
            </div>
            {% endif %}
            {% endif %}
        {% endfor %}
        </div>
    </div>
{% endfor %}
</div>