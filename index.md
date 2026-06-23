---
layout: default
---
{%- assign p = site.data.profile -%}

# {{ p.basics.name }}

{{ p.basics.pronouns }} · {{ p.basics.email }} · {{ p.basics.location.city }}, {{ p.basics.location.region }}

{% for link in p.basics.links -%}
{%- if link.url and link.url != "" %}[{{ link.label }}]({{ link.url }}) · {% endif -%}
{%- endfor %}

## Summaries

{% for s in p.summaries %}
**{{ s.id }}** — _{{ s.audience | join: ", " }} · {{ s.length }} · {{ s.status }}_

{{ s.text }}
{% endfor %}

## Roles

{% for role in site.data.roles -%}
{%- unless role.visibility == "private" %}
### {{ role.title }} — {{ role.org }}

_{{ role.start }} → {{ role.end | default: "present" }}_ · {{ role.location }} · {{ role.type }}
{% if role.tags %}
Tags: {{ role.tags | join: ", " }}
{% endif %}
{%- comment -%} role.notes is an internal curation field (provenance, "confirm…" flags). Never render it. {%- endcomment -%}
{% for bullet in site.data.bullets -%}
{%- if bullet.role_id == role.id %}
- {{ bullet.text | strip_newlines }}
{%- endif -%}
{%- endfor %}
{% endunless -%}
{%- endfor %}

## Projects

{% for proj in site.data.projects -%}
{%- unless proj.visibility == "private" %}
### {{ proj.title }}

_{{ proj.start }}{% if proj.end %} → {{ proj.end }}{% endif %}_{% if proj.role %} · {{ proj.role }}{% endif %}{% if proj.type %} · {{ proj.type }}{% endif %}

{{ proj.description }}
{% if proj.collaborators and proj.collaborators != empty %}
Collaborators: {{ proj.collaborators | join: ", " }}
{% endif %}
{% for bullet in site.data.bullets -%}
{%- if bullet.project_id == proj.id %}
- {{ bullet.text | strip_newlines }}
{%- endif -%}
{%- endfor %}
{% endunless -%}
{%- endfor %}

## Education

{% for ed in site.data.education %}
### {{ ed.credential }} — {{ ed.institution }}

_{{ ed.start }} → {{ ed.end }}_ · {{ ed.location }}
{% for h in ed.highlights %}
- {{ h }}
{%- endfor %}
{% endfor %}

## Skills

{% for skill in site.data.skills -%}
{%- unless skill.visibility == "private" %}
- **{{ skill.name }}** — {{ skill.proficiency }} · _{{ skill.category }}_{% if skill.last_used %} · last used {{ skill.last_used }}{% endif %}
{%- endunless -%}
{%- endfor %}

{%- comment -%}
Life section intentionally omitted from the public site.
life.yml holds sensitive, draft-status family entries and has no working
visibility filter (the `visibility: private` guard was a no-op — no entry set
the field). This repo is PUBLIC. To publish Life later, re-add a curated
life.yml (see bin/pull-cv-data.sh) and deliberately restore this section.
{%- endcomment -%}
