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
 Knobs. Rewritten with Dyl 2026-08-31 (plain register), then cut back hard
 2026-09-02 when the hero was removed.

 GONE, and not to be reintroduced without Dyl saying so: `tagline`,
 `exec_summary`, `personal_statement`. All three were the page asserting who he
 is before the reader had asked. The lens menu does that job now by showing the
 shape of the work instead of describing it. If you find yourself wanting a
 headline back, the thing to write is a better lens one-liner.

 `credentials` survives and now renders in the Education section.
 `availability` still drives the closing CTA.
{%- endcomment -%}

{%- comment -%}
 OUTBOUND-LINK POLICY — REVISED BY DYL 2026-09-02. The 08-31 rule ("don't
 send visitors away") is PARTLY REVERSED: evidence now outranks containment.
 A CV that says "I directed a performance film for Lars Jan" and gives you no
 way to watch it is asking to be taken on faith. So links out are now welcome
 where they PROVE something — press, venues, client project pages, the company
 you worked at, and the film itself. vimeo.com came OFF the blocklist because
 most of the arts work has no third-party video and Dyl's archive is the only
 place it can be watched. Roles carry a `url` too now (roles.yml), rendered by
 _includes/lens-role.html under the same blocklist.
 STILL BLOCKED, deliberately: sleep-nod.com and the Substack. Those are
 destinations, not evidence — LinkedIn in the footer stays the single hop that
 carries anyone who wants the whole portfolio. Third-party PRESS links on projects
 STAY — they are evidence somebody else published the work. Dyl's own channels
 (LinkedIn, portfolio, Substack, Vimeo, the repo) come off, except one LinkedIn
 link in the footer; LinkedIn is the hop that carries anyone who wants more on
 to the portfolio. Email uses site.contact_email (the dylanward.work alias), not
 the Gmail in the source database.
 dylanward.work is on the list ON PURPOSE: project.cv-database points at this very
 site (its url was the github.io address until 2026-08-31, which the list already
 caught). Blocking it keeps the CV-database project from rendering a self-link.
 Any project link whose url contains a substring below is dropped by
 _includes/lens-projects.html — that include can see this variable because
 Jekyll includes share the page's scope.
{%- endcomment -%}
{%- assign link_blocklist = "sleepnod.substack.com,sleep-nod.com,linkedin.com,github.io,github.com,dylanward.work" -%}

{%- capture exec_summary -%}
Two years running intake at a dual-diagnosis residential program in San Francisco, where I also rebuilt the systems around the job: the referral pipeline, the utilization reporting, and the Epic templates the program ran on. Before that, five years of agency project management in New York.
{%- endcapture -%}

{%- capture availability -%}
Available for <strong>part- or full-time</strong> work: behavioral-health operations, quality and utilization reporting, EHR and Avatar workflow support, program coordination, teaching or research assistance. Based in San Francisco; remote or Bay Area in person.
{%- endcapture -%}

{%- assign credentials = "PMP &mdash; Project Management Professional,MHRS &mdash; Mental Health Rehabilitation Specialist &middot; NPI-registered,Epic &amp; Avatar EHR,Google Data Analytics,M.A. Clinical Mental Health Counseling (Jan 2027)" | split: "," -%}

{%- assign featured_degrees = "edu.palo-alto-cmhc,edu.uw-ba" | split: "," -%}
{%- assign featured_certs = "edu.pmp,edu.mhrs,edu.google-data-analytics" | split: "," -%}

{%- assign p = site.data.profile -%}

{%- comment -%}
 THE OPENING — rebuilt with Dyl 2026-09-02.
 Cut deliberately, DO NOT REINTRODUCE: the h1 name, the tagline, the identity
 line, the exec_summary paragraph and the credential chip row. A reader (Dyl's
 partner) hit the old hero, read it as a normal résumé header, and could not
 tell what the page was FOR. The fix is not a better headline — it is to stop
 asserting and start explaining. The page now opens by naming itself as a made
 thing and handing over the controls; the credentials moved down to Education,
 where someone looking for them will look.
 The greeting is Dyl's own line, semicolon included.
{%- endcomment -%}
<header class="hero hero--greeting">
  <p class="greeting">Thanks for being here;</p>
  <p class="greeting__what">I&rsquo;ve worked in clinics, agencies, and theaters, and I want what I&rsquo;ve learned there to leave people better off. Read the part you came for.</p>
</header>

<div class="lens-layout" id="experience">

  <nav class="lensbar" data-lensbar aria-label="View experience">
    <h2 class="lensbar__title">View Experience</h2>
    <ul>
      <li><button type="button" data-lens="all" aria-pressed="false">All</button></li>
      <li><button type="button" data-lens="clinical" aria-pressed="false">Clinical</button></li>
      <li><button type="button" data-lens="digital" aria-pressed="false">Health IT &amp; Data</button></li>
      <li><button type="button" data-lens="teaching" aria-pressed="false">Teaching</button></li>
      <li><button type="button" data-lens="arts" aria-pressed="false">Arts and Event Production</button></li>
    </ul>
  </nav>

  <div class="lens-panels">

  {%- comment -%} ── Start state: shown only when JS is on and nothing is picked ── {%- endcomment -%}
  {%- comment -%}
   The start panel is a MENU, not a placeholder (2026-09-02). Its job is the
   "oh, they made this" moment: before you click anything you can already see
   the whole shape of the career and choose your way in. Each line is a real
   button wired to the same JS as the sidebar. Keep these one-liners matched to
   each panel's own lens-intro — they are the same promise, made twice.
  {%- endcomment -%}
  <section class="lens-panel lens-prompt is-active" data-lens="start">
    <ul class="lens-menu">
      <li><button type="button" data-lens="clinical"><span class="lens-menu__name">Clinical</span><span class="lens-menu__what">Intake and assessment, groups, clinical documentation, and harm reduction.</span></button></li>
      <li><button type="button" data-lens="digital"><span class="lens-menu__name">Health IT &amp; Data</span><span class="lens-menu__what">EHR workflow, documentation compliance, utilization reporting, and referral pipelines.</span></button></li>
      <li><button type="button" data-lens="teaching"><span class="lens-menu__name">Teaching</span><span class="lens-menu__what">Psychoeducation and skills groups, drug-safety workshops, clinician training, and agile coaching.</span></button></li>
      <li><button type="button" data-lens="arts"><span class="lens-menu__name">Arts and Event Production</span><span class="lens-menu__what">Performance films made for other artists, immersive installations, live events, touring crews, and records.</span></button></li>
      <li><button type="button" data-lens="all"><span class="lens-menu__name">All</span><span class="lens-menu__what">The whole record, in one page.</span></button></li>
    </ul>
    <p class="lens-menu__aside">Or take the one-page <a href="{{ '/assets/Dylan_Ward_Resume.pdf' | relative_url }}">r&eacute;sum&eacute; (PDF)</a>.</p>
  </section>

  {%- comment -%} ═══ ALL ═══ {%- endcomment -%}
  <section class="lens-panel" data-lens="all">
    <h2 class="section__title">Experience</h2>
    {% include lens-roles.html title="Behavioral health" ids="role.prc-baker-intake,role.baaahs-harm-reduction,role.lifelong-outreach" limit="4" %}
    {% include lens-roles.html title="Project management" ids="role.edelman-spm,role.ab-scrum,role.jump450-spm,role.future-colossal-cpm,role.evia-producer,role.cafe-suspiro-biz-dev" limit="3" %}
    {% include lens-roles.html title="Arts &amp; community" ids="role.sleep-nod-producer,role.easy-street-producer,role.velocity-production,role.base-arts-coordinator,role.baaahs-food-director,role.crfw-consultant" limit="2" %}

    <h2 class="section__title">Skills</h2>
    {% include skill-group.html title="Project management" ids="skill.project-management,skill.agile-scrum,skill.process-improvement,skill.stakeholder-management,skill.program-design,skill.budget-management,skill.data-analysis,skill.people-development" key="skill.project-management,skill.agile-scrum,skill.process-improvement,skill.stakeholder-management" %}
    {% include skill-group.html title="Clinical" ids="skill.clinical-intake,skill.clinical-documentation,skill.case-management,skill.harm-reduction,skill.group-facilitation,skill.psychoeducation,skill.clinical-assessments,skill.crisis-communication" key="skill.clinical-intake,skill.clinical-documentation,skill.case-management,skill.harm-reduction" %}
    {% include skill-group.html title="Health IT" ids="skill.epic-superuser,skill.medical-records-research,skill.billable-documentation,skill.hipaa-compliance,skill.clinical-note-formats" key="skill.epic-superuser,skill.medical-records-research,skill.billable-documentation" %}
    {% include skill-group.html title="Tools" ids="skill.pm-tooling,skill.workflow-automation,skill.ai-llm-systems,skill.martech-analytics,skill.microsoft-365,skill.adobe-creative-suite" %}
    {% include skill-group.html title="Creative production" ids="skill.event-production,skill.video-production,skill.sound-design,skill.choreography,skill.arts-administration,skill.grant-administration" %}

    <h2 class="section__title">Selected Projects</h2>
    {% include lens-projects.html ids="project.sleep-nod-reel-2018,project.arctic-refuge-2019,project.windows-111-2019,project.megatrends-2019,project.rehearsal-13-problems-2016,project.material-deviation-2018,project.tim-e-2017,project.clear-and-sweet-2016,project.worth-my-salt-2014,project.still-becoming,project.desert-mode" %}
  </section>

  {%- comment -%} ═══ CLINICAL ═══ {%- endcomment -%}
  <section class="lens-panel" data-lens="clinical">
    <h2 class="section__title">Clinical</h2>
    <p class="lens-intro">Intake and assessment, groups, clinical documentation, and harm reduction.</p>
    {% include lens-roles.html ids="role.prc-baker-intake,role.baaahs-harm-reduction,role.lifelong-outreach" tags="intake-assessment,case-management,group-facilitation,clinical-documentation,health-it,compliance,dual-diagnosis,harm-reduction,psychoeducation,crisis-response,peer-support,outreach,substance-use,queer-competency" limit="7" %}
    {% include lens-roles.html title="Systems work from other settings" ids="role.jump450-spm,role.edelman-spm,role.ab-scrum" tags="process-improvement,data-analysis,health-it,automation" limit="2" %}

    <h2 class="section__title">Skills</h2>
    {% include skill-group.html title="Clinical" ids="skill.clinical-intake,skill.clinical-assessments,skill.clinical-documentation,skill.clinical-note-formats,skill.case-management,skill.harm-reduction,skill.overdose-response,skill.group-facilitation,skill.psychoeducation,skill.community-outreach,skill.crisis-communication" key="skill.clinical-intake,skill.clinical-documentation,skill.case-management,skill.harm-reduction" %}
    {% include skill-group.html title="Systems &amp; documentation" ids="skill.epic-superuser,skill.medical-records-research,skill.billable-documentation,skill.hipaa-compliance,skill.process-improvement,skill.data-analysis,skill.program-design,skill.project-management,skill.microsoft-365" key="skill.epic-superuser,skill.medical-records-research,skill.billable-documentation" %}

    <h2 class="section__title">Writing</h2>
    {% include lens-projects.html ids="project.still-becoming,project.desert-mode" %}
  </section>

  {%- comment -%} ═══ SYSTEMS, DATA & HEALTH IT (data-lens stays "digital" so /#view-digital deep links keep working) ═══ {%- endcomment -%}
  <section class="lens-panel" data-lens="digital">
    <h2 class="section__title">Health IT &amp; Data</h2>
    <p class="lens-intro">EHR workflow, documentation compliance, utilization reporting, and referral pipelines.</p>
    {% include lens-roles.html title="Inside a behavioral-health program" ids="role.prc-baker-intake" tags="health-it,compliance,data-analysis,process-improvement,automation" limit="6" %}
    {% include lens-roles.html title="Agency project management" ids="role.edelman-spm,role.ab-scrum,role.jump450-spm,role.cafe-suspiro-biz-dev,role.evia-producer" tags="project-management,process-improvement,data-analysis,automation,agile,scrum,stakeholder-management,budget-management,leadership,revenue" limit="3" %}

    <h2 class="section__title">Skills</h2>
    {% include skill-group.html title="Health IT" ids="skill.epic-superuser,skill.billable-documentation,skill.hipaa-compliance,skill.medical-records-research,skill.clinical-note-formats,skill.clinical-documentation" key="skill.epic-superuser,skill.billable-documentation,skill.hipaa-compliance" %}
    {% include skill-group.html title="Project management" ids="skill.project-management,skill.agile-scrum,skill.process-improvement,skill.stakeholder-management,skill.budget-management,skill.data-analysis,skill.program-design,skill.people-development" key="skill.project-management,skill.agile-scrum,skill.process-improvement,skill.data-analysis" %}
    {% include skill-group.html title="Tools" ids="skill.pm-tooling,skill.workflow-automation,skill.ai-llm-systems,skill.martech-analytics,skill.microsoft-365" key="skill.workflow-automation" %}

    <h2 class="section__title">Selected Projects</h2>
    {% include lens-projects.html ids="project.cv-database,project.windows-111-2019,project.arctic-refuge-2019,project.megatrends-2019" %}
  </section>

  {%- comment -%} ═══ TEACHING & FACILITATION — working with a group in a room ═══ {%- endcomment -%}
  <section class="lens-panel" data-lens="teaching">
    <h2 class="section__title">Teaching</h2>
    <p class="lens-intro">Psychoeducation and skills groups for dual-diagnosis clients. Drug-safety workshops at festivals. Training clinicians on documentation, and coaching twelve brand teams through an agile transition.</p>
    {% include lens-roles.html title="Groups &amp; training in care settings" ids="role.prc-baker-intake,role.baaahs-harm-reduction" tags="group-facilitation,psychoeducation,program-design,mentorship" limit="4" %}
    {% include lens-roles.html title="Agile coaching" ids="role.ab-scrum,role.edelman-spm,role.jump450-spm" tags="agile,scrum,mentorship" limit="3" %}
    {% include lens-roles.html title="Arts workshops" ids="role.base-arts-coordinator,role.sleep-nod-producer" tags="organizing,grant-administration" limit="1" %}

    <h2 class="section__title">Skills</h2>
    {% include skill-group.html title="Facilitation" ids="skill.group-facilitation,skill.psychoeducation,skill.program-design,skill.people-development,skill.agile-scrum,skill.community-outreach,skill.crisis-communication,skill.harm-reduction" key="skill.group-facilitation,skill.psychoeducation,skill.people-development,skill.agile-scrum" %}
    {% include skill-group.html title="Assessment &amp; research" ids="skill.clinical-assessments,skill.clinical-intake,skill.data-analysis,skill.clinical-documentation,skill.microsoft-365" key="skill.clinical-assessments,skill.data-analysis" %}

    <h2 class="section__title">Writing</h2>
    {% include lens-projects.html ids="project.still-becoming,project.desert-mode" %}
  </section>

  {%- comment -%}
   ═══ ARTS AND EVENT PRODUCTION ═══
   Merged 2026-09-02 from the old "Onsite Projects" and "Arts" lenses, at Dyl's
   direction. They were one modality pretending to be two: physical space, a
   fixed date, other people's vision to serve. Splitting them buried the
   contract work — the performance films made for Alice Gosti, Lars Jan,
   zoe|juniper, Cherdonna and Dayna Hanson were scattered across both.
   data-lens stays "arts" so /#view-arts still resolves; /#view-onsite is
   aliased to it in _includes/scripts.html so the old deep link is not broken.
   ORDER IS THE POINT (Dyl): collaborations lead, his own authored work goes
   last and stays short. Do not promote "My own work" up this panel.
  {%- endcomment -%}
  <section class="lens-panel" data-lens="arts">
    <h2 class="section__title">Arts and Event Production</h2>
    <p class="lens-intro">Performance films made for other artists, immersive installations, live events, and touring crews. Records under Sleep Nod.</p>
    {% include lens-roles.html title="Hired by other artists" ids="role.sleep-nod-producer" tags="documentary,video-direction,arts-administration,grant-administration,event-production,project-management" limit="3" %}
    {% include lens-roles.html title="Immersive &amp; live events" ids="role.future-colossal-cpm,role.evia-producer,role.baaahs-food-director,role.easy-street-producer" tags="event-production,project-management,budget-management,stakeholder-management,leadership,immersive,installation,community,mutual-aid" limit="3" %}
    {% include lens-roles.html title="Venues, grants &amp; community" ids="role.velocity-production,role.base-arts-coordinator,role.crfw-consultant" tags="arts-administration,grant-administration,event-production,organizing,community,performance" limit="2" %}
    {% include lens-roles.html title="Programming in a care setting" ids="role.prc-baker-intake" tags="program-design" limit="2" %}

    <h2 class="section__title">Skills</h2>
    {% include skill-group.html title="Production" ids="skill.event-production,skill.project-management,skill.budget-management,skill.stakeholder-management,skill.program-design,skill.people-development" key="skill.event-production,skill.project-management,skill.budget-management" %}
    {% include skill-group.html title="Creative" ids="skill.video-production,skill.sound-design,skill.choreography,skill.arts-administration,skill.grant-administration,skill.adobe-creative-suite,skill.pm-tooling" key="skill.video-production,skill.sound-design" %}

    <h2 class="section__title">Selected Work</h2>
    {%- comment -%}
     "Start here" is one 85-second reel. A stranger who will not watch eleven
     performance films will watch one, and this is the fastest route into the
     whole body of work. Keep it alone in its group — the moment a second item
     joins it, it stops being an obvious first click.
    {%- endcomment -%}
    {% include lens-projects.html title="Start here" ids="project.sleep-nod-reel-2018" %}
    {% include lens-projects.html title="Made with other artists" ids="project.material-deviation-2018,project.no-one-2018,project.tim-e-2017,project.great-hunger-2017,project.as-you-like-it-2017,project.fuzzy-math-2017,project.rehearsal-13-problems-2016,project.clear-and-sweet-2016,project.bodies-of-water-2016,project.its-a-boy-2015,project.cold-light-day-2014,project.worth-my-salt-2014,project.disagreeable-tale-2014" %}
    {% include lens-projects.html title="Immersive &amp; events" ids="project.arctic-refuge-2019,project.megatrends-2019,project.windows-111-2019" %}
    {% include lens-projects.html title="My own work" ids="project.artpg-2022,project.lesser-evils-2017,project.melody-nelson-2015,project.work-magic-thinking-2015" %}
    {% include lens-projects.html title="Music" ids="project.responsibilities-2025,project.whyers-2022,project.talking-to-myself-2022" %}
  </section>

  </div>
</div>

<section class="section" id="education">
  <h2 class="section__title">Education &amp; Credentials</h2>
  {%- comment -%}
   The chip row USED to sit in the hero. It moved here 2026-09-02 when the hero
   was cut: a credential is something a reader goes looking for, not something
   that needs to interrupt them on arrival. `credentials` is still the knob.
  {%- endcomment -%}
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
  </div>
</section>

{%- comment -%}
Life section intentionally omitted from the public site.
life.yml holds sensitive, draft-status family entries and has no working
visibility filter. This repo is PUBLIC. To publish Life later, re-add a curated
life.yml (see bin/pull-cv-data.sh) and deliberately restore this section.
{%- endcomment -%}
