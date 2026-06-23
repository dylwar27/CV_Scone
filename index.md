---
layout: default
---
{%- comment -%}
═══════════════════════════════════════════════════════════════════════════════
 CURATION KNOBS — this is where you re-curate the public CV.
 These lists live in the TEMPLATE, not in _data/, so they SURVIVE
 `bin/pull-cv-data.sh` (which overwrites _data/ from the source database).
 NEVER curate by hand-editing _data/*.yml — those edits get clobbered on pull.
 To re-curate: change a `lead_summary_id`, bump `bullets_per_role`, or add /
 remove an id in one of the featured_* / skills_* lists below. Ids come from the
 `id:` fields in _data/*.yml. Within a role, which bullets show = the first N in
 bullets.yml (reorder there in the source DB to change the pick).
═══════════════════════════════════════════════════════════════════════════════
{%- endcomment -%}
{%- assign lead_summary_id = "summary.general" -%}
{%- assign bullets_per_role = 3 -%}
{%- assign featured_projects = "project.arctic-refuge-2019,project.windows-111-2019,project.megatrends-2019,project.tim-e-2017,project.material-deviation-2018,project.worth-my-salt-2014,project.simply-put-2015,project.still-becoming,project.desert-mode" | split: "," -%}
{%- assign skills_clinical = "skill.clinical-intake,skill.harm-reduction,skill.group-facilitation,skill.case-management,skill.clinical-documentation,skill.crisis-communication" | split: "," -%}
{%- assign skills_pm = "skill.project-management,skill.agile-scrum,skill.stakeholder-management,skill.process-improvement,skill.data-analysis,skill.budget-management" | split: "," -%}
{%- assign skills_creative = "skill.event-production,skill.video-production,skill.sound-design,skill.choreography,skill.arts-administration" | split: "," -%}
{%- assign featured_degrees = "edu.palo-alto-cmhc,edu.uw-ba" | split: "," -%}
{%- assign featured_certs = "edu.pmp,edu.mhrs,edu.google-data-analytics" | split: "," -%}
{%- assign p = site.data.profile -%}

# {{ p.basics.name }}

{{ p.basics.pronouns }} · {{ p.basics.email }} · {{ p.basics.location.city }}, {{ p.basics.location.region }}

{% for link in p.basics.links -%}
{%- if link.url and link.url != "" %}[{{ link.label }}]({{ link.url }}) · {% endif -%}
{%- endfor %}

{%- assign lead = p.summaries | where: "id", lead_summary_id | first -%}
{% if lead %}
{{ lead.text | strip_newlines }}
{% endif %}

## Experience

{% for role in site.data.roles -%}
{%- unless role.visibility == "private" -%}

### {{ role.title }} — {{ role.org }}

_{{ role.start }} → {{ role.end | default: "present" }}_ · {{ role.location }} · {{ role.type }}
{% assign role_bullets = site.data.bullets | where: "role_id", role.id %}
{% for bullet in role_bullets limit: bullets_per_role %}
- {{ bullet.text | strip_newlines }}
{%- endfor %}
{% endunless -%}
{%- endfor %}

## Selected Projects

{% for id in featured_projects -%}
{%- assign proj = site.data.projects | where: "id", id | first -%}
{%- if proj and proj.visibility != "private" -%}

### {{ proj.title }}

_{{ proj.start | slice: 0, 4 }}{% if proj.end == "ongoing" %} – ongoing{% endif %}_{% if proj.role %} · {{ proj.role }}{% endif %}

{{ proj.description | strip_newlines }}
{% if proj.collaborators and proj.collaborators != empty %}
With: {{ proj.collaborators | join: ", " }}
{% endif -%}
{%- endif -%}
{%- endfor %}

## Skills

### Clinical & Behavioral Health
{% for id in skills_clinical -%}
{%- assign skill = site.data.skills | where: "id", id | first -%}
{%- if skill and skill.visibility != "private" %}
- **{{ skill.name }}**{% if skill.proficiency %} — {{ skill.proficiency }}{% endif %}
{%- endif -%}
{%- endfor %}

### Project & Program Management
{% for id in skills_pm -%}
{%- assign skill = site.data.skills | where: "id", id | first -%}
{%- if skill and skill.visibility != "private" %}
- **{{ skill.name }}**{% if skill.proficiency %} — {{ skill.proficiency }}{% endif %}
{%- endif -%}
{%- endfor %}

### Creative Production
{% for id in skills_creative -%}
{%- assign skill = site.data.skills | where: "id", id | first -%}
{%- if skill and skill.visibility != "private" %}
- **{{ skill.name }}**{% if skill.proficiency %} — {{ skill.proficiency }}{% endif %}
{%- endif -%}
{%- endfor %}

## Education

{% for id in featured_degrees -%}
{%- assign ed = site.data.education | where: "id", id | first -%}
{%- if ed -%}

### {{ ed.credential }} — {{ ed.institution }}

_{{ ed.start | slice: 0, 4 }} → {{ ed.end | slice: 0, 4 }}_ · {{ ed.location }}
{% for h in ed.highlights %}
- {{ h }}
{%- endfor %}
{%- endif -%}
{%- endfor %}

## Certifications

{% for id in featured_certs -%}
{%- assign cert = site.data.education | where: "id", id | first -%}
{%- if cert %}
- **{{ cert.credential }}** — {{ cert.institution }} · {{ cert.start | slice: 0, 4 }}{% if cert.honors and cert.honors != empty %} · {{ cert.honors | join: ", " }}{% endif %}
{%- endif -%}
{%- endfor %}

{%- comment -%}
Life section intentionally omitted from the public site.
life.yml holds sensitive, draft-status family entries and has no working
visibility filter (the `visibility: private` guard was a no-op — no entry set
the field). This repo is PUBLIC. To publish Life later, re-add a curated
life.yml (see bin/pull-cv-data.sh) and deliberately restore this section.
{%- endcomment -%}
