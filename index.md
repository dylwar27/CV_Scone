---
layout: default
---
{%- comment -%}
═══════════════════════════════════════════════════════════════════════════════
 THE MAIN PAGE (rebuilt 2026-10-24 from SITE_TRACKS_2026-10-22.md).
 Dyl, 2026-10-22: drop the "pick the experience" chooser. The main page is a
 short general résumé with top results, and links at the bottom to one plain
 one-page résumé per track, each at its own address:
   /clinical  (clinical.md)  ·  /projects  (projects.md)  ·  /events  (events.md)
 Paths, not subdomains (Dyl, 2026-10-22). No Vimeo links anywhere (Dyl,
 2026-10-23).

 These pages are plain text in the template. They do NOT read _data/, so
 bin/pull-cv-data.sh never changes them. When a fact changes in the source
 database, change it here too.

 Old deep links (/#view-clinical, /#view-agency, /#view-arts, …) are forwarded
 to the matching track page by _includes/scripts.html.
═══════════════════════════════════════════════════════════════════════════════
{%- endcomment -%}

<header class="hero">
  <h1 class="hero__name">Dylan Ward</h1>
  <p class="hero__tagline">Counselor in training and digital project manager &middot; Oakland, CA</p>
  <p class="hero__lead">Two years running intake at a dual-diagnosis residential program in San Francisco, where I also rebuilt the systems around the job: the referral pipeline, the utilization reporting, and the Epic templates the program ran on. Before that, five years of agency project management in New York. Now an MFT trainee at Palo Alto University&rsquo;s Sexual and Gender Identities Clinic.</p>
</header>

<section class="section" id="results">
  <h2 class="section__title">Selected results</h2>
  <article class="entry">
    <div class="entry__when">Results</div>
    <div class="entry__body">
      <ul>
        <li>Raised average bed utilization at PRC Baker Places from 62% to over 78% by digitizing intake and referral tracking.</li>
        <li>Replaced a fax-based referral process across four houses, partner jails, and SF DPH. Placements got 25&ndash;50% faster and missed referrals dropped to near zero.</li>
        <li>Wrote a five-tier escalation protocol for a festival harm-reduction program serving 200&ndash;800 people, and trained the volunteers who run it.</li>
        <li>Found senior-labor utilization running 10&ndash;15% over target at Edelman DxI. My staffing recommendations returned it to target, and margin grew 10% year over year.</li>
        <li>Built an approval pipeline between Wegmans and Jump450 that cut asset time-to-market from 2&ndash;3 weeks to 3&ndash;4 days.</li>
      </ul>
    </div>
  </article>
</section>

<section class="section" id="now">
  <h2 class="section__title">Now</h2>
  <article class="entry">
    <div class="entry__when">Sep 2026 &ndash; Present</div>
    <div class="entry__body">
      <h3 class="entry__title">MFT Trainee</h3>
      <p class="entry__org">Sexual and Gender Identities Clinic, Palo Alto University</p>
    </div>
  </article>
  <article class="entry">
    <div class="entry__when">Expected Jun 2027</div>
    <div class="entry__body">
      <h3 class="entry__title">M.A., Clinical Mental Health Counseling</h3>
      <p class="entry__org">Palo Alto University</p>
    </div>
  </article>
</section>

<section class="section" id="credentials">
  <h2 class="section__title">Credentials</h2>
  <ul class="creds">
    <li>MHRS (CA DHCS), NPI-registered</li>
    <li>PMP (Project Management Institute)</li>
    <li>Google Data Analytics Certificate</li>
    <li>B.A., University of Washington</li>
  </ul>
</section>

<section class="section" id="more">
  <h2 class="section__title">More</h2>
  <div class="actions" style="margin-top:1.25rem">
    <a class="btn btn--ghost" href="{{ '/clinical/' | relative_url }}">Clinical operations</a>
    <a class="btn btn--ghost" href="{{ '/projects/' | relative_url }}">Project management</a>
    <a class="btn btn--ghost" href="{{ '/events/' | relative_url }}">Events &amp; production</a>
    <a class="btn btn--ghost" href="{{ '/assets/Dylan_Ward_Resume.pdf' | relative_url }}">One-page r&eacute;sum&eacute; (PDF)</a>
  </div>
</section>
