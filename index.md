---
layout: default
---
{%- comment -%}
═══════════════════════════════════════════════════════════════════════════════
 CURATION KNOBS — this is where you re-curate the public CV.
 These live in the TEMPLATE, not in _data/, so they SURVIVE bin/pull-cv-data.sh
 (which overwrites _data/ from the source database).
 NEVER curate by hand-editing _data/*.yml — those edits get clobbered on pull.
 Facts, links and press belong in the source database; framing belongs here.

 HOW THE VIEWS WORK
 Three tabs, three panels (2026-10-22: the start menu and the "All" panel are
 gone — Dyl: "make the split simpler for folks", "go all"). The page lands on
 Clinical; the résumés already deep-link to /#view-clinical. Each panel names
 (a) which roles it shows, in order, and (b) which bullet TAGS qualify — a
 bullet appears if it carries any of them. That is what lets a panel pull
 relevant work out of an unrelated industry (the CRFW / Jump450 / Edelman
 systems bullets inside Clinical).

 THE AXIS IS SETTING since 2026-09-08 (Dyl): Clinical (key `clinical`) =
 behavioral-health programs and the systems inside them · Agency (`agency`) =
 agencies and their clients · Creative (`arts`) = his own and other artists'
 work, kept out of every other panel. Old keys alias in _includes/scripts.html
 (digital→clinical, onsite→arts, teaching→clinical, all→clinical). `data-lens`
 keys never change. Tag vocabulary lives in _data/bullets.yml. Within a role,
 the bullets shown are the first N matching in that file — reorder there, in
 the source database, to change the pick. Bullets with status: draft or
 archived never render (lens-role.html).

 TO ADD OR REMOVE A VIEW: add a button in the tab row and a matching panel with
 the same data-lens value. Each panel's <h2> must match its tab label.
═══════════════════════════════════════════════════════════════════════════════
{%- endcomment -%}

{%- comment -%}
 GONE, and not to be reintroduced without Dyl saying so: `tagline`,
 `exec_summary`, `personal_statement`, the h1 name, the identity line, the hero
 chip row, the start menu (2026-10-22). `credentials` renders in Education.
 `availability` drives the closing CTA — cut to two sentences 2026-10-22 (the
 middle one, "where the clinical judgment and the systems around it are the
 same job", was a thesis line; see feedback_voice).
{%- endcomment -%}

{%- comment -%}
 OUTBOUND-LINK POLICY (Dyl, 2026-09-02): evidence outranks containment. Links
 out are welcome where they PROVE something — press, venues, client pages, the
 company, the film itself, and (2026-10-22) the two public tools on github.io.
 STILL BLOCKED: sleep-nod.com and the Substack (destinations, not evidence —
 LinkedIn in the footer is the one hop to the whole portfolio), linkedin.com
 (footer only), github.com (repo pages), and dylanward.work itself (keeps the
 CV-database project from rendering a self-link). Any link whose url contains a
 substring below is dropped by lens-projects.html / lens-role.html.
{%- endcomment -%}
{%- assign link_blocklist = "sleepnod.substack.com,sleep-nod.com,linkedin.com,github.com,dylanward.work" -%}

{%- capture availability -%}
Available for <strong>part- or full-time</strong> work, remote or in person in the Bay Area. Happy to talk about anything on this page.
{%- endcapture -%}

{%- assign credentials = "PMP &mdash; Project Management Professional,MHRS &mdash; Mental Health Rehabilitation Specialist &middot; NPI-registered,Epic &amp; Avatar EHR,Google Data Analytics,M.A. Clinical Mental Health Counseling (Jun 2027)" | split: "," -%}

{%- assign featured_degrees = "edu.palo-alto-cmhc,edu.uw-ba" | split: "," -%}
{%- assign featured_certs = "edu.pmp,edu.mhrs,edu.google-data-analytics" | split: "," -%}

{%- assign p = site.data.profile -%}

{%- comment -%}
 THE OPENING — Dyl's own two lines (2026-09-08), nothing more. No CTA after it.
{%- endcomment -%}
<header class="hero hero--greeting">
  <p class="greeting">Thanks for being here,</p>
  <p class="greeting__what">I&rsquo;ve worked in a variety of environments, and I want what I&rsquo;ve learned to leave people better off.</p>
</header>

<div class="lens-layout" id="experience">

  {%- comment -%}
   The tab row. Order and labels: Clinical · Agency · Creative. One idea per
   label (feedback_voice); the intro line under each panel carries the
   keywords the label dropped ("Health IT", "project management").
  {%- endcomment -%}
  <nav class="lensbar" data-lensbar aria-label="View experience">
    <ul>
      <li><button type="button" data-lens="clinical" aria-pressed="false">Clinical</button></li>
      <li><button type="button" data-lens="agency" aria-pressed="false">Agency</button></li>
      <li><button type="button" data-lens="arts" aria-pressed="false">Creative</button></li>
    </ul>
  </nav>

  <div class="lens-panels">

  {%- comment -%}
   ═══ CLINICAL ═══
   Merged 2026-09-08 at Dyl's direction from the old "Clinical" and "Health IT
   & Data" (key `digital`) panels. data-lens stays "clinical". No creative work
   in this panel — Dyl: "don't link creative work to the other tabs."
  {%- endcomment -%}
  <section class="lens-panel" data-lens="clinical">
    <h2 class="section__title">Clinical</h2>
    <p class="lens-intro">Intake and assessment, groups, harm reduction, EHR workflow, and utilization reporting.</p>
    {% include lens-roles.html title="Inside a behavioral-health program" ids="role.prc-baker-intake" limit="8" %}
    {% include lens-roles.html title="Harm reduction and outreach" ids="role.baaahs-harm-reduction,role.lifelong-outreach" tags="harm-reduction,crisis-response,psychoeducation,outreach,peer-support,substance-use,case-management,program-design,policy-design,queer-competency" limit="4" %}
    {%- comment -%} CRFW archive: lead with the policy / sensitivity-triage bullets (the T&S-shaped evidence), not the storage work. {%- endcomment -%}
    {% include lens-roles.html title="Systems work" ids="role.crfw-archive-lead" tags="trust-and-safety,policy-design" limit="3" %}
    {% include lens-roles.html ids="role.jump450-spm,role.edelman-spm" tags="data-analysis,automation,process-improvement" limit="3" %}

    <h2 class="section__title">Skills</h2>
    {% include skill-group.html title="Clinical" ids="skill.clinical-intake,skill.clinical-assessments,skill.clinical-documentation,skill.clinical-note-formats,skill.case-management,skill.harm-reduction,skill.overdose-response,skill.group-facilitation,skill.psychoeducation,skill.community-outreach,skill.crisis-communication" key="skill.clinical-intake,skill.clinical-documentation,skill.case-management,skill.harm-reduction" %}
    {% include skill-group.html title="Health IT" ids="skill.epic-superuser,skill.billable-documentation,skill.hipaa-compliance,skill.medical-records-research,skill.data-analysis,skill.process-improvement,skill.program-design,skill.content-policy-triage,skill.data-modeling" key="skill.epic-superuser,skill.billable-documentation,skill.hipaa-compliance,skill.data-analysis" %}
    {% include skill-group.html title="Tools" ids="skill.workflow-automation,skill.ai-llm-systems,skill.pm-tooling,skill.microsoft-365" key="skill.workflow-automation" %}

    <h2 class="section__title">Selected Projects</h2>
    {%- comment -%} The two public tools joined 2026-10-22 — proof of work the résumé can point at (best-practices note: make it findable, not just existent). {%- endcomment -%}
    {% include lens-projects.html ids="project.pid5-scorer,project.influence-genogram,project.cv-database" %}
  </section>

  {%- comment -%}
   ═══ AGENCY ═══
   Added 2026-09-08 at Dyl's direction. The agency years: Edelman, Jump450,
   Future Colossal, Evia; plus the client-side consulting (Anheuser-Busch
   scrum, Cafe Suspiro). The experiential projects made at Future Colossal
   live here, not in the creative panel — they were agency deliverables.
  {%- endcomment -%}
  <section class="lens-panel" data-lens="agency">
    <h2 class="section__title">Agency</h2>
    <p class="lens-intro">Project management for agencies and their clients: scoping, budgets, reporting, agile coaching, and experiential production.</p>
    {% include lens-roles.html title="Agency project management" ids="role.edelman-spm,role.jump450-spm,role.future-colossal-cpm,role.evia-producer" tags="project-management,process-improvement,data-analysis,automation,agile,stakeholder-management,budget-management,leadership,revenue,event-production,immersive,video-direction" limit="4" %}
    {% include lens-roles.html title="Consulting" ids="role.ab-scrum,role.cafe-suspiro-biz-dev" tags="agile,scrum,leadership,process-improvement,automation,data-analysis,budget-management,stakeholder-management" limit="4" %}

    <h2 class="section__title">Skills</h2>
    {% include skill-group.html title="Project management" ids="skill.project-management,skill.agile-scrum,skill.process-improvement,skill.stakeholder-management,skill.budget-management,skill.data-analysis,skill.people-development,skill.change-management" key="skill.project-management,skill.agile-scrum,skill.process-improvement,skill.stakeholder-management" %}
    {% include skill-group.html title="Tools" ids="skill.pm-tooling,skill.workflow-automation,skill.martech-analytics,skill.microsoft-365,skill.adobe-creative-suite" key="skill.pm-tooling,skill.workflow-automation" %}

    <h2 class="section__title">Selected Projects</h2>
    {% include lens-projects.html ids="project.arctic-refuge-2019,project.windows-111-2019,project.megatrends-2019" %}
  </section>

  {%- comment -%}
   ═══ CREATIVE (key `arts`; was "Independent Creative Work", renamed 2026-10-22) ═══
   Creative work lives ONLY in this panel. ORDER IS THE POINT (Dyl):
   collaborations lead, his own authored work goes last and stays short. Do not
   promote "My own work" up this panel. /#view-onsite aliases here.
  {%- endcomment -%}
  <section class="lens-panel" data-lens="arts">
    <h2 class="section__title">Creative</h2>
    <p class="lens-intro">Performance films for other artists, dance and theater, records as Sleep Nod, and arts venues and festivals.</p>
    {% include lens-roles.html title="Hired by other artists" ids="role.sleep-nod-producer" tags="documentary,video-direction,arts-administration,grant-administration,event-production,project-management" limit="3" %}
    {% include lens-roles.html title="Venues and festivals" ids="role.velocity-production,role.base-arts-coordinator,role.easy-street-producer,role.baaahs-food-director,role.crfw-consultant" tags="arts-administration,grant-administration,event-production,organizing,community,performance,mutual-aid" limit="2" %}

    <h2 class="section__title">Skills</h2>
    {% include skill-group.html title="Production" ids="skill.event-production,skill.project-management,skill.budget-management,skill.stakeholder-management,skill.program-design,skill.people-development" key="skill.event-production,skill.project-management,skill.budget-management" %}
    {% include skill-group.html title="Creative" ids="skill.video-production,skill.sound-design,skill.choreography,skill.arts-administration,skill.grant-administration,skill.adobe-creative-suite" key="skill.video-production,skill.sound-design" %}

    <h2 class="section__title">Selected Work</h2>
    {%- comment -%}
     "Start here" is one 85-second reel. Keep it alone in its group — the moment
     a second item joins it, it stops being an obvious first click.
    {%- endcomment -%}
    {% include lens-projects.html title="Start here" ids="project.sleep-nod-reel-2018" %}
    {% include lens-projects.html title="Made with other artists" ids="project.material-deviation-2018,project.no-one-2018,project.tim-e-2017,project.great-hunger-2017,project.as-you-like-it-2017,project.fuzzy-math-2017,project.rehearsal-13-problems-2016,project.clear-and-sweet-2016,project.bodies-of-water-2016,project.its-a-boy-2015,project.cold-light-day-2014,project.worth-my-salt-2014,project.disagreeable-tale-2014" %}
    {% include lens-projects.html title="My own work" ids="project.artpg-2022,project.lesser-evils-2017,project.dogged-2016,project.work-magic-thinking-2015,project.melody-nelson-2015" %}
    {% include lens-projects.html title="Music" ids="project.responsibilities-2025,project.whyers-2022,project.talking-to-myself-2022" %}
    {% include lens-projects.html title="Writing" ids="project.still-becoming,project.desert-mode" %}
  </section>

  </div>
</div>

<section class="section" id="education">
  <h2 class="section__title">Education &amp; Credentials</h2>
  <ul class="creds creds--edu">
    {%- for c in credentials %}
    <li>{{ c }}</li>
    {%- endfor %}
  </ul>
  {%- for id in featured_degrees -%}
  {%- assign ed = site.data.education | where: "id", id | first -%}
  {%- if ed -%}
  {%- assign from = ed.start | slice: 0, 4 -%}
  {%- if ed.end == nil or ed.end == "ongoing" -%}{%- assign to = "Present" -%}{%- else -%}{%- assign to = ed.end | slice: 0, 4 -%}{%- endif -%}
  <article class="entry">
    <div class="entry__when">{{ from }} &ndash; {{ to }}</div>
    <div class="entry__body">
      <h4 class="entry__title">{{ ed.credential }}</h4>
      <p class="entry__org">{{ ed.institution }}</p>
      <p class="entry__meta">{{ ed.location }}</p>
      {%- if ed.highlights and ed.highlights != empty %}
      <ul>
        {%- for h in ed.highlights %}
        <li>{{ h }}</li>
        {%- endfor %}
      </ul>
      {%- endif %}
    </div>
  </article>
  {%- endif -%}
  {%- endfor -%}
  <article class="entry">
    <div class="entry__when">Certifications</div>
    <div class="entry__body">
      <ul>
        {%- for id in featured_certs -%}
        {%- assign cert = site.data.education | where: "id", id | first -%}
        {%- if cert %}
        <li><strong>{{ cert.credential }}</strong> &mdash; {{ cert.institution }} &middot; {{ cert.start | slice: 0, 4 }}{% if cert.honors and cert.honors != empty %} &middot; {{ cert.honors | join: ", " }}{% endif %}</li>
        {%- endif -%}
        {%- endfor %}
      </ul>
    </div>
  </article>
</section>

<section class="cta" id="contact">
  <h2>Let's talk.</h2>
  <p>{{ availability | strip_newlines | strip }}</p>
  <div class="actions">
    <a class="btn" href="mailto:{{ site.contact_email }}">{{ site.contact_email }}</a>
    <a class="btn btn--ghost" href="{{ '/assets/Dylan_Ward_Resume.pdf' | relative_url }}">R&eacute;sum&eacute; (PDF)</a>
  </div>
</section>

{%- comment -%}
Life section intentionally omitted from the public site.
life.yml holds sensitive, draft-status family entries and has no working
visibility filter. This repo is PUBLIC. To publish Life later, re-add a curated
life.yml (see bin/pull-cv-data.sh) and deliberately restore this section.
{%- endcomment -%}
