# Feature Implementation Plan — alejandro band website (¡Con Gusto!)

**Overall Progress:** `100%` — all steps done; initial commit pushed to private repo as `main`. Remaining work is calendar-gated (see Deferred Items + DEPLOY.md).

- Steps 1–3: images in `i/` at 2x display size; check.sh red→green; index.html + style.css ported with all replacements, dead CSS pruned. Deviation: title.jpg shipped at 720px wide (2x of 360 display width) for retina.
- Step 4 (design round): palette sampled from artwork (ink #272525 / cream #f0e8d8 / amber #c98b45 / anthurium #cf4a2c); page bg matches title-image bg so the hand-lettered wordmark floats seamlessly (title.jpg cropped to the 720×230 wordmark band, `mix-blend-mode:lighten` swallows jpg noise); Courier Prime typewriter mono; focus-visible/selection/hover states; ● dot favicon echoing the wordmark. Deviations from template: styling consolidated into style.css (inline block removed); invalid `<p><div>` embed nesting fixed; iframe given aspect-ratio 16/9 for mobile.
- Step 5: verified at 1280px and 390px via screenshots; check.sh green. Video embed renders (unlisted, so it previews now — goes public Oct 20).
- Step 6: CNAME, DEPLOY.md (Porkbun DNS + Oct 20 go-live commands), .gitignore; private repo `ags2121/alejandro-theband-website` created and set as origin.

**Original Prompt:** [PROMPT.md](./PROMPT.md) · Q&A: [QUESTIONS-1.md](./QUESTIONS-1.md) / [ANSWERS-1.md](./ANSWERS-1.md)

One-page static site (index.html + style.css + images), cloned from petsportal.net structure. No build step, no framework.

## Tasks:

- [x] 🟩 **Step 1: Images**
  - [x] 🟩 Copy the 3 downloaded Dropbox images into `i/` as `title.jpg`, `cover.jpg`, `band.jpg`
  - [x] 🟩 Resize for web (cover 2953px→600px, band 5067px→1200px, title 1080×1920→360px wide) via `sips`
  - [x] 🟩 Update PLAN.md

- [x] 🟩 **Step 2: Content check (test-first)**
  - [x] 🟩 Write `check.sh`: greps index.html for required content (¡Con Gusto!, anaheim embed id, band member links, email, FIXMEs, tiktok) and absence of pets leftovers (petsportal.net, petsnyc, GA tag, pets.nwhyc). Fails now — index.html doesn't exist yet.
  - [x] 🟩 Update PLAN.md

- [x] 🟩 **Step 3: index.html + style.css**
  - [x] 🟩 `style.css`: copy from template (2 lines)
  - [x] 🟩 `index.html` from template with: title `alejandro`; local image paths; cover linked to bandcamp.com/alejandrotheband; album line "new album ¡Con Gusto! out February 5 2027" (link on "February 5 2027" → bandcamp); single video embed `ubxWFNi0-Ow` captioned `"anaheim" | video by jon campolo`; Listen = bandcamp / youtube (google.com + FIXME) / apple music (google.com + FIXME); Instagram → alejandro_theband; Tik Tok → @alejandrotheband; email line; band photo with "alejandro is:" credits line above (ryan el-solh unlinked); no GA tag, no dead commented code, no Merch/nina, no ascii art
  - [x] 🟩 Prune CSS rules referencing assets we don't ship (`@font-face` → missing fonts, `.ani`/keyframes → `i/animals/*`, `.ascii` rules) so nothing 404s
  - [x] 🟩 `check.sh` passes
  - [x] 🟩 Update PLAN.md

- [x] 🟩 **Step 4: Frontend design round (/frontend-design)**
  - [x] 🟩 Brainstorm design plan grounded in the ¡Con Gusto! artwork: view the three images, derive a 4–6 color token palette from the album art, choose display/body type, pick one signature element. Constraint: stay inside the lo-fi single-column band-site vernacular the template establishes — this is a refinement pass giving alejandro its own identity, not a rebuild into a landing page.
  - [x] 🟩 Self-critique the design plan against the brief (reject generic defaults), then apply to index.html/style.css
  - [x] 🟩 Screenshot-iterate: serve locally, screenshot, critique, adjust (incl. the portrait title-image watch item; quality floor: mobile-responsive, visible focus, reduced motion respected)
  - [x] 🟩 `check.sh` still passes after design changes
  - [x] 🟩 Update PLAN.md

- [x] 🟩 **Step 5: Localhost verification (end goal)**
  - [x] 🟩 Serve with `python3 -m http.server`, screenshot via browser, visually confirm layout/images/embed
  - [x] 🟩 Update PLAN.md

- [x] 🟩 **Step 6: Deploy prep (site stays unpublished until Oct 20)**
  - [x] 🟩 `CNAME` file: `alejandrotheband.com`
  - [x] 🟩 `DEPLOY.md`: Porkbun DNS records (apex A records + www CNAME) + the exact Oct 20 commands (make repo public, enable Pages, enforce HTTPS)
  - [x] 🟩 Create **private** GitHub repo `ags2121/alejandro-theband-website`, set as origin
  - [x] 🟩 Commit (user approval first); push as `main` (repo has no commits yet, so the feature branch content becomes the initial `main`)
  - [x] 🟩 Update PLAN.md with final status

## Plan critique notes (Phase 3)

- Ordering is sound: images → check.sh (fails) → html (check passes) → localhost view → deploy prep. Feedback loop reaches a viewable page at Step 4, the session's stated end goal.
- **Known-expected at verification:** the anaheim embed will render "Video unavailable" until the video goes public Oct 20 — the iframe itself rendering is the pass criterion.
- **Watch item:** title image is portrait 1080×1920 (not a wide logo like pets'). At width 360 it displays ~640px tall. Screenshot check decides if it looks right; flag to user if awkward.
- Debug tooling sufficient: check.sh + http.server + browser screenshot. No open questions → no QUESTIONS-PLAN file needed.

## Deferred Items

- Real YouTube Music / Apple Music listen URLs — awaiting links from user; `(FIXME)` markers in place (per ANSWERS-1).
- Making the site live (public repo + Pages + DNS active) — deliberately deferred to **October 20** per embargo (per ANSWERS-1).
