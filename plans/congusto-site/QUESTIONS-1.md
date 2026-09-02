# Questions — Round 1

I fetched the petsportal.net template (single static `index.html` + tiny `style.css` + favicon), verified all three Dropbox images download fine, and confirmed `gh` is authenticated as `ags2121`.

## Q1. Anaheim video embed

The template shows videos as YouTube iframe embeds. You gave the caption (`"anaheim" | video by jon campolo`) but no video URL — presumably because it's private until October 20.

- **(a)** You give me the YouTube URL now (unlisted is fine) and I embed it — it just won't be visible to anyone until the site goes live Oct 20.
- **(b)** I put a placeholder embed with a `TODO` comment, and you swap the URL in later.

## Q2. "Don't publish yet" strategy

GitHub Pages on a free account only works from a **public** repo. Proposed approach:

- Create the repo **private** now with everything finished, including the `CNAME` file for alejandrotheband.com.
- You can set up the Porkbun DNS records anytime before launch (I'll write exact instructions into the repo).
- On October 20: flip the repo to public + enable Pages (one `gh` command each — I'll document them, or you ask me then).

OK? (Alternative: public repo now with Pages disabled — but then anyone who finds the repo can see the album art/announcement early.)

## Q3. Ryan el-solh has no link

You listed 5 names but 4 links (jesse→cjheesvsaen, andy→andycush, charlie→hack_c, alex→alexsilvamusic.biz). I'll leave **ryan el-solh** as plain unlinked text. Correct?

## Q4. Listen section links

"Keep as is" — but the three remaining links (bandcamp / youtube / apple music) currently point to **pets'** profiles. I assume:

- bandcamp → `https://bandcamp.com/alejandrotheband`
- youtube → ? (need alejandro's YouTube Music / channel URL, or I keep it pointing at pets, which seems wrong)
- apple music → ? (same)

Give me the two URLs, or tell me to drop those two links until you have them.

## Q5. Instagram link

You said to remove nina, Merch, and Tik Tok — so the **Instagram** link stays, but it points to `instagram.com/pets.nyc`. What's the band's Instagram URL? (Or should Instagram go too?)

## Q6. Page title

Browser-tab title is currently `pets`. I'll change it to `alejandro` unless you want something else. The pets favicon (a tiny 16x16 icon) — I'll drop it and leave the default unless you have one you want.

## Defaults I'll apply without asking (flag if wrong)

- Download the 3 Dropbox images into the repo (`i/` folder) instead of hotlinking Dropbox — Dropbox links break/throttle and are slow.
- Resize the cover (2953×2953, 7.4MB) and band photo (5067×3483, 1MB) down to web-appropriate sizes; originals are overkill for a 300px slot.
- Remove pets' Google Analytics tag (it's their tracking ID).
- Remove pets' commented-out dead code (old ascii logo, Live shows section, animal animation).
- Bandcamp URL used exactly as you gave it: `https://bandcamp.com/alejandrotheband` (note: bandcamp artist pages are usually `artist.bandcamp.com` — double-check this is the right URL).
