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

 HOW THE LENSES WORK
 Each lens is a panel below. A lens names (a) which roles it shows, in order,
 and (b) which bullet TAGS qualify — a bullet appears if it carries any of them.
 That is what lets a lens pull relevant work out of an unrelated industry: the
 Systems lens surfaces the PRC Baker bullets tagged health-it and data-analysis,
 and skips the group-facilitation ones; the Teaching lens does the reverse.

 THE AXIS IS MODALITY, NOT INDUSTRY (decision 2026-08-24). Clinical = working
 with a person in distress · Systems = working through systems and data ·
 Teaching = working with a group in a room · Onsite = working in physical space
 with fixed deadlines · Arts = working in an expressive medium. Never add an
 industry-shaped lens ("Healthcare"); rename or retag instead. Tag vocabulary lives in
 _data/bullets.yml. Within a role, the bullets shown are the first N matching in
 that file — reorder there, in the source database, to change the pick.

 TO ADD OR REMOVE A LENS: add a button in the sidebar and a matching panel with
 the same data-lens value. Nothing else needs to change.
═══════════════════════════════════════════════════════════════════════════════
{%- endcomment -%}

{%- comment -%}
 The four knobs below carry the POSITIONING (JOB_SEARCH.md; rewritten by Dyl 2026-08-25):
 "Collaborative assessment as intervention — with individuals and with systems."
 exec_summary is word-for-word the résumé summary (profile.yml → summary.assessment-codesign).
 If the résumé summary changes, change it here too. Availability is PART- OR FULL-TIME (changed 08-25).
{%- endcomment -%}

{%- assign tagline = "Collaborative Assessment as Intervention &middot; Behavioral and mental health, health IT &amp; program management &middot; San Francisco" -%}
{%- assign link_order = "LinkedIn,Portfolio,Substack (Sleep Nod)" -%}

{%- capture exec_summary -%}
Counselor-in-Training, Behavioral-health Clinician (MHRS) and Digital Project Manager (PMP). Direct experience authoring, managing, and reporting within EHR data (Epic, Avatar); media production and agency project management in New York and Seattle; M.A. in Clinical Mental Health Counseling in progress (Palo Alto University, expected Jan 2027).
{%- endcapture -%}

{%- capture personal_statement -%}
I don't take a presenting issue at face value, and I don't solve it alone. I've run intake across four dual-diagnosis residential houses and lifted bed utilization from 62% to 78%+ by rebuilding the referral pipeline; I've built a PMO and led an agile transition across a multi-team division; and I've sat with someone in their deepest feelings. I've led real change in organizational and personal areas by remaining curious about cause, building measured, real next steps, and documenting.
{%- endcapture -%}

{%- capture availability -%}
Available for <strong>part- or full-time</strong> work in behavioral-health operations, quality and utilization reporting, EHR and Avatar workflow support, program coordination, and teaching or research assistance. Supervised, structured settings. Based in San Francisco; remote preferred, Bay Area in person works.
{%- endcapture -%}

{%- assign credentials = "PMP &mdash; Project Management Professional,MHRS &mdash; Mental Health Rehabilitation Specialist &middot; NPI-registered,Epic &amp; Avatar EHR,Google Data Analytics,M.A. Clinical Mental Health Counseling (Jan 2027)" | split: "," -%}

{%- assign featured_degrees = "edu.palo-alto-cmhc,edu.uw-ba" | split: "," -%}
{%- assign featured_certs = "edu.pmp,edu.mhrs,edu.google-data-analytics" | split: "," -%}

{%- assign p = site.data.profile -%}

<header class="hero">
  <h1 class="hero__name">{{ p.basics.name }}</h1>
  <p class="hero__tagline">{{ tagline }}</p>
  <p class="hero__lead">{{ exec_summary | strip_newlines | strip }}</p>
  <p class="hero__statement">{{ personal_statement | strip_newlines | strip }}</p>
  <div class="actions">
    <a class="btn" href="mailto:{{ p.basics.email }}">Email me</a>
    {%- include contact-links.html order=link_order -%}
  </div>
  <p class="meta-line">{{ p.basics.pronouns }} &middot; {{ p.basics.location.city }}, {{ p.basics.location.region }} &middot; <a href="mailto:{{ p.basics.email }}">{{ p.basics.email }}</a></p>
  <ul class="creds">
    {%- for c in credentials %}
    <li>{{ c }}</li>
    {%- endfor %}
  </ul>
  <p class="hero__cta"><a class="btn btn--big" href="#experience">View my experience &darr;</a></p>
</header>

<div class="lens-layout" id="experience">

  <nav class="lensbar" data-lensbar aria-label="View experience">
    <h2 class="lensbar__title">View Experience</h2>
    <ul>
      <li><button type="button" data-lens="all" aria-pressed="false">All</button></li>
      <li><button type="button" data-lens="clinical" aria-pressed="false">Clinical Work</button></li>
      <li><button type="button" data-lens="digital" aria-pressed="false">Systems, Data &amp; Health IT</button></li>
      <li><button type="button" data-lens="teaching" aria-pressed="false">Teaching &amp; Facilitation</button></li>
      <li><button type="button" data-lens="onsite" aria-pressed="false">Onsite Project Management</button></li>
      <li><button type="button" data-lens="arts" aria-pressed="false">Arts Production</button></li>
    </ul>
  </nav>

  <div class="lens-panels">

  {%- comment -%} ── Start state: shown only when JS is on and nothing is picked ── {%- endcomment -%}
  <section class="lens-panel lens-prompt is-active" data-lens="start">
    <p class="prompt">Pick a lens on the left and the r&eacute;sum&eacute; fills in — the same career, framed for the work you're hiring for. <strong>All</strong> shows everything.</p>
  </section>

  {%- comment -%} ═══ ALL ═══ {%- endcomment -%}
  <section class="lens-panel" data-lens="all">
    <h2 class="section__title">Experience</h2>
    {% include lens-roles.html title="Healthcare &amp; behavioral health operations" ids="role.prc-baker-intake,role.baaahs-harm-reduction,role.lifelong-outreach" limit="4" %}
    {% include lens-roles.html title="Project, program &amp; systems management" ids="role.edelman-spm,role.ab-scrum,role.jump450-spm,role.future-colossal-cpm,role.evia-producer,role.cafe-suspiro-biz-dev" limit="3" %}
    {% include lens-roles.html title="Arts production &amp; community work" ids="role.sleep-nod-producer,role.easy-street-producer,role.velocity-production,role.base-arts-coordinator,role.baaahs-food-director,role.crfw-consultant" limit="2" %}

    <h2 class="section__title">Skills</h2>
    {% include skill-group.html title="Project &amp; systems management" ids="skill.project-management,skill.agile-scrum,skill.process-improvement,skill.stakeholder-management,skill.program-design,skill.budget-management,skill.data-analysis,skill.people-development" key="skill.project-management,skill.agile-scrum,skill.process-improvement,skill.stakeholder-management" %}
    {% include skill-group.html title="Clinical &amp; behavioral health" ids="skill.clinical-intake,skill.clinical-documentation,skill.case-management,skill.harm-reduction,skill.group-facilitation,skill.psychoeducation,skill.clinical-assessments,skill.crisis-communication" key="skill.clinical-intake,skill.clinical-documentation,skill.case-management,skill.harm-reduction" %}
    {% include skill-group.html title="Health IT &amp; compliance" ids="skill.epic-superuser,skill.medical-records-research,skill.billable-documentation,skill.hipaa-compliance,skill.clinical-note-formats" key="skill.epic-superuser,skill.medical-records-research,skill.billable-documentation" %}
    {% include skill-group.html title="Tools &amp; platforms" ids="skill.pm-tooling,skill.workflow-automation,skill.ai-llm-systems,skill.martech-analytics,skill.microsoft-365,skill.adobe-creative-suite" %}
    {% include skill-group.html title="Creative production" ids="skill.event-production,skill.video-production,skill.sound-design,skill.choreography,skill.arts-administration,skill.grant-administration" %}

    <h2 class="section__title">Selected Projects</h2>
    {% include lens-projects.html ids="project.arctic-refuge-2019,project.windows-111-2019,project.megatrends-2019,project.tim-e-2017,project.material-deviation-2018,project.worth-my-salt-2014,project.simply-put-2015,project.still-becoming,project.desert-mode" %}
  </section>

  {%- comment -%} ═══ CLINICAL ═══ {%- endcomment -%}
  <section class="lens-panel" data-lens="clinical">
    <h2 class="section__title">Clinical Work</h2>
    <p class="lens-intro">Direct behavioral health practice — intake and assessment, group programming, clinical documentation, and harm reduction — plus the systems work that made the care actually reach people.</p>
    {% include lens-roles.html ids="role.prc-baker-intake,role.baaahs-harm-reduction,role.lifelong-outreach" tags="intake-assessment,case-management,group-facilitation,clinical-documentation,health-it,compliance,dual-diagnosis,harm-reduction,psychoeducation,crisis-response,peer-support,outreach,substance-use,queer-competency" limit="7" %}
    {% include lens-roles.html title="Systems work that transfers into care settings" ids="role.jump450-spm,role.edelman-spm,role.ab-scrum" tags="process-improvement,data-analysis,health-it,automation" limit="2" %}

    <h2 class="section__title">Skills</h2>
    {% include skill-group.html title="Clinical &amp; behavioral health" ids="skill.clinical-intake,skill.clinical-assessments,skill.clinical-documentation,skill.clinical-note-formats,skill.case-management,skill.harm-reduction,skill.overdose-response,skill.group-facilitation,skill.psychoeducation,skill.community-outreach,skill.crisis-communication" key="skill.clinical-intake,skill.clinical-documentation,skill.case-management,skill.harm-reduction" %}
    {% include skill-group.html title="Systems &amp; documentation" ids="skill.epic-superuser,skill.medical-records-research,skill.billable-documentation,skill.hipaa-compliance,skill.process-improvement,skill.data-analysis,skill.program-design,skill.project-management,skill.microsoft-365" key="skill.epic-superuser,skill.medical-records-research,skill.billable-documentation" %}

    <h2 class="section__title">Writing</h2>
    {% include lens-projects.html ids="project.still-becoming,project.desert-mode" %}
  </section>

  {%- comment -%} ═══ SYSTEMS, DATA & HEALTH IT (data-lens stays "digital" so /#view-digital deep links keep working) ═══ {%- endcomment -%}
  <section class="lens-panel" data-lens="digital">
    <h2 class="section__title">Systems, Data &amp; Health IT</h2>
    <p class="lens-intro">Working through systems and data: EHR workflow and documentation compliance, utilization reporting, referral pipelines, and the PMO, agile, and automation work underneath them — built inside a behavioral-health facility and inside New York agencies.</p>
    {% include lens-roles.html title="Inside a behavioral-health program" ids="role.prc-baker-intake" tags="health-it,compliance,data-analysis,process-improvement,automation" limit="6" %}
    {% include lens-roles.html title="Agency PMO, agile &amp; reporting" ids="role.edelman-spm,role.ab-scrum,role.jump450-spm,role.cafe-suspiro-biz-dev,role.evia-producer" tags="project-management,process-improvement,data-analysis,automation,agile,scrum,stakeholder-management,budget-management,leadership,revenue" limit="3" %}

    <h2 class="section__title">Skills</h2>
    {% include skill-group.html title="Health IT &amp; compliance" ids="skill.epic-superuser,skill.billable-documentation,skill.hipaa-compliance,skill.medical-records-research,skill.clinical-note-formats,skill.clinical-documentation" key="skill.epic-superuser,skill.billable-documentation,skill.hipaa-compliance" %}
    {% include skill-group.html title="Project &amp; systems management" ids="skill.project-management,skill.agile-scrum,skill.process-improvement,skill.stakeholder-management,skill.budget-management,skill.data-analysis,skill.program-design,skill.people-development" key="skill.project-management,skill.agile-scrum,skill.process-improvement,skill.data-analysis" %}
    {% include skill-group.html title="Tools &amp; platforms" ids="skill.pm-tooling,skill.workflow-automation,skill.ai-llm-systems,skill.martech-analytics,skill.microsoft-365" key="skill.workflow-automation" %}

    <h2 class="section__title">Selected Projects</h2>
    {% include lens-projects.html ids="project.cv-database,project.windows-111-2019,project.arctic-refuge-2019,project.megatrends-2019" %}
  </section>

  {%- comment -%} ═══ TEACHING & FACILITATION — working with a group in a room ═══ {%- endcomment -%}
  <section class="lens-panel" data-lens="teaching">
    <h2 class="section__title">Teaching &amp; Facilitation</h2>
    <p class="lens-intro">Working with a group in a room: psychoeducation and skills groups for dual-diagnosis clients, drug-safety workshops at festivals, training clinicians on documentation, coaching twelve brand teams through an agile transition, and mentoring the people who run programs after you leave. Facilitation is facilitation, whatever the room.</p>
    {% include lens-roles.html title="Groups, psychoeducation &amp; training in care settings" ids="role.prc-baker-intake,role.baaahs-harm-reduction" tags="group-facilitation,psychoeducation,program-design,mentorship" limit="4" %}
    {% include lens-roles.html title="Agile coaching &amp; team training" ids="role.ab-scrum,role.edelman-spm,role.jump450-spm" tags="agile,scrum,mentorship" limit="3" %}
    {% include lens-roles.html title="Workshops &amp; teaching artists" ids="role.base-arts-coordinator,role.sleep-nod-producer" tags="organizing,grant-administration" limit="1" %}

    <h2 class="section__title">Skills</h2>
    {% include skill-group.html title="Facilitation &amp; teaching" ids="skill.group-facilitation,skill.psychoeducation,skill.program-design,skill.people-development,skill.agile-scrum,skill.community-outreach,skill.crisis-communication,skill.harm-reduction" key="skill.group-facilitation,skill.psychoeducation,skill.people-development,skill.agile-scrum" %}
    {% include skill-group.html title="Assessment &amp; research" ids="skill.clinical-assessments,skill.clinical-intake,skill.data-analysis,skill.clinical-documentation,skill.microsoft-365" key="skill.clinical-assessments,skill.data-analysis" %}

    <h2 class="section__title">Writing</h2>
    {% include lens-projects.html ids="project.still-becoming,project.desert-mode" %}
  </section>

  {%- comment -%} ═══ ONSITE PM ═══ {%- endcomment -%}
  <section class="lens-panel" data-lens="onsite">
    <h2 class="section__title">Onsite Project Management</h2>
    <p class="lens-intro">Producing in physical space: immersive installations, live events, touring crews, vendors, and load-in deadlines that don't move.</p>
    {% include lens-roles.html ids="role.future-colossal-cpm,role.evia-producer,role.baaahs-food-director,role.velocity-production,role.easy-street-producer,role.base-arts-coordinator" tags="event-production,project-management,budget-management,stakeholder-management,leadership,community,mutual-aid,organizing,performance,arts-administration" limit="3" %}
    {% include lens-roles.html title="Programming and logistics in other settings" ids="role.prc-baker-intake" tags="program-design" limit="2" %}

    <h2 class="section__title">Skills</h2>
    {% include skill-group.html title="Production &amp; delivery" ids="skill.event-production,skill.project-management,skill.budget-management,skill.stakeholder-management,skill.program-design,skill.people-development" key="skill.event-production,skill.project-management,skill.budget-management" %}
    {% include skill-group.html title="Craft &amp; tools" ids="skill.video-production,skill.sound-design,skill.arts-administration,skill.pm-tooling,skill.adobe-creative-suite" %}

    <h2 class="section__title">Selected Projects</h2>
    {% include lens-projects.html ids="project.arctic-refuge-2019,project.megatrends-2019,project.windows-111-2019,project.simply-put-2015" %}
  </section>

  {%- comment -%} ═══ ARTS ═══ {%- endcomment -%}
  <section class="lens-panel" data-lens="arts">
    <h2 class="section__title">Arts Production</h2>
    <p class="lens-intro">Choreography, sound score, video direction, and the producing and grant work that got the work made and toured. Work under the name Sleep Nod &mdash; the full portfolio is at <a href="https://sleep-nod.com">sleep-nod.com</a>, a video archive at <a href="https://vimeo.com/dfw">vimeo.com/dfw</a>, and the writing at <a href="https://sleepnod.substack.com">Substack</a>.</p>
    {% include lens-roles.html ids="role.sleep-nod-producer,role.future-colossal-cpm,role.evia-producer,role.baaahs-food-director,role.crfw-consultant,role.easy-street-producer,role.velocity-production,role.base-arts-coordinator" tags="choreography,sound-design,video-direction,documentary,performance,arts-administration,grant-administration,event-production,immersive,installation,community,organizing,mutual-aid" limit="2" %}

    <h2 class="section__title">Skills</h2>
    {% include skill-group.html title="Creative production" ids="skill.event-production,skill.video-production,skill.sound-design,skill.choreography,skill.arts-administration,skill.grant-administration" key="skill.sound-design,skill.video-production,skill.event-production" %}
    {% include skill-group.html title="Tools" ids="skill.adobe-creative-suite,skill.pm-tooling" %}

    <h2 class="section__title">Selected Work</h2>
    {% include lens-projects.html ids="project.tim-e-2017,project.material-deviation-2018,project.worth-my-salt-2014,project.arctic-refuge-2019,project.simply-put-2015,project.still-becoming,project.desert-mode" %}
  </section>

  </div>
</div>

<section class="section" id="education">
  <h2 class="section__title">Education &amp; Credentials</h2>
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
    <a class="btn" href="mailto:{{ p.basics.email }}">{{ p.basics.email }}</a>
    {%- include contact-links.html order=link_order -%}
  </div>
</section>

{%- comment -%}
Life section intentionally omitted from the public site.
life.yml holds sensitive, draft-status family entries and has no working
visibility filter. This repo is PUBLIC. To publish Life later, re-add a curated
life.yml (see bin/pull-cv-data.sh) and deliberately restore this section.
{%- endcomment -%}
