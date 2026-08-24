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
 Digital PM lens surfaces the PRC Baker bullets tagged process-improvement and
 data-analysis, and skips the group-facilitation ones. Tag vocabulary lives in
 _data/bullets.yml. Within a role, the bullets shown are the first N matching in
 that file — reorder there, in the source database, to change the pick.

 TO ADD OR REMOVE A LENS: add a button in the sidebar and a matching panel with
 the same data-lens value. Nothing else needs to change.
═══════════════════════════════════════════════════════════════════════════════
{%- endcomment -%}

{%- assign tagline = "Project &amp; program management &middot; Healthcare and behavioral health operations &middot; San Francisco" -%}
{%- assign link_order = "LinkedIn,Portfolio,Substack (Sleep Nod)" -%}

{%- capture exec_summary -%}
I'm a project and systems manager with a PMP and fifteen years of making complicated operations run — five of them building PMOs and running programs inside New York agencies, the most recent two inside behavioral health in San Francisco. At PRC Baker Places I ran intake across four dual-diagnosis residential houses, worked daily in Epic and Avatar, and lifted bed utilization from 62% to 78%+ by digitizing the referral pipeline. I'm finishing an M.A. in Clinical Mental Health Counseling at Palo Alto University.
{%- endcapture -%}

{%- capture personal_statement -%}
The through-line is systems in service of people. I've built a PMO and run an agile transition across a twelve-team division, and I've sat with someone in an altered state at four in the morning. Underneath, it's the same job: see what's actually happening, make the next step possible, and leave the process better documented than you found it. I'm looking for project, program, and operations work where healthcare systems meet the people using them — and I'm glad to hear about good problems outside that lane too.
{%- endcapture -%}

{%- capture availability -%}
Open to project, program, and operations roles across healthcare, behavioral health, and EHR/workflow — full-time, contract, or consulting. Currently in San Francisco and open to remote.
{%- endcapture -%}

{%- assign credentials = "PMP &mdash; Project Management Professional,MHRS &mdash; Mental Health Rehabilitation Specialist,Epic &amp; Avatar EHR,M.A. Clinical Mental Health Counseling (2027)" | split: "," -%}

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
      <li><button type="button" data-lens="digital" aria-pressed="false">Digital Project Management</button></li>
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
    {% include skill-group.html title="Tools &amp; platforms" ids="skill.pm-tooling,skill.martech-analytics,skill.microsoft-365,skill.adobe-creative-suite" %}
    {% include skill-group.html title="Creative production" ids="skill.event-production,skill.video-production,skill.sound-design,skill.choreography,skill.arts-administration,skill.grant-administration" %}

    <h2 class="section__title">Selected Projects</h2>
    {% include lens-projects.html ids="project.arctic-refuge-2019,project.windows-111-2019,project.megatrends-2019,project.tim-e-2017,project.material-deviation-2018,project.worth-my-salt-2014,project.simply-put-2015,project.still-becoming,project.desert-mode" %}
  </section>

  {%- comment -%} ═══ CLINICAL ═══ {%- endcomment -%}
  <section class="lens-panel" data-lens="clinical">
    <h2 class="section__title">Clinical Work</h2>
    <p class="lens-intro">Direct behavioral health practice — intake and assessment, group programming, clinical documentation, and harm reduction — plus the systems work that made the care actually reach people.</p>
    {% include lens-roles.html ids="role.prc-baker-intake,role.baaahs-harm-reduction,role.lifelong-outreach" tags="intake-assessment,case-management,group-facilitation,clinical-documentation,dual-diagnosis,harm-reduction,psychoeducation,crisis-response,peer-support,outreach,substance-use,queer-competency" limit="5" %}
    {% include lens-roles.html title="Systems work that transfers into care settings" ids="role.jump450-spm,role.edelman-spm,role.ab-scrum" tags="process-improvement,data-analysis" limit="2" %}

    <h2 class="section__title">Skills</h2>
    {% include skill-group.html title="Clinical &amp; behavioral health" ids="skill.clinical-intake,skill.clinical-assessments,skill.clinical-documentation,skill.clinical-note-formats,skill.case-management,skill.harm-reduction,skill.overdose-response,skill.group-facilitation,skill.psychoeducation,skill.community-outreach,skill.crisis-communication" key="skill.clinical-intake,skill.clinical-documentation,skill.case-management,skill.harm-reduction" %}
    {% include skill-group.html title="Systems &amp; documentation" ids="skill.process-improvement,skill.data-analysis,skill.program-design,skill.project-management,skill.microsoft-365" %}

    <h2 class="section__title">Writing</h2>
    {% include lens-projects.html ids="project.still-becoming,project.desert-mode" %}
  </section>

  {%- comment -%} ═══ DIGITAL PM ═══ {%- endcomment -%}
  <section class="lens-panel" data-lens="digital">
    <h2 class="section__title">Digital Project Management</h2>
    <p class="lens-intro">Agency-side program management, PMO building, agile transitions, and the reporting and automation stacks underneath them — including the ones I built inside a healthcare facility.</p>
    {% include lens-roles.html ids="role.prc-baker-intake,role.cafe-suspiro-biz-dev,role.edelman-spm,role.ab-scrum,role.jump450-spm,role.evia-producer" tags="project-management,process-improvement,data-analysis,agile,scrum,stakeholder-management,budget-management,leadership,revenue,clinical-documentation" limit="4" %}

    <h2 class="section__title">Skills</h2>
    {% include skill-group.html title="Project &amp; systems management" ids="skill.project-management,skill.agile-scrum,skill.process-improvement,skill.stakeholder-management,skill.budget-management,skill.data-analysis,skill.program-design,skill.people-development" key="skill.project-management,skill.agile-scrum,skill.process-improvement,skill.data-analysis" %}
    {% include skill-group.html title="Tools &amp; platforms" ids="skill.pm-tooling,skill.martech-analytics,skill.microsoft-365,skill.clinical-documentation" %}

    <h2 class="section__title">Selected Projects</h2>
    {% include lens-projects.html ids="project.windows-111-2019,project.arctic-refuge-2019,project.megatrends-2019" %}
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
