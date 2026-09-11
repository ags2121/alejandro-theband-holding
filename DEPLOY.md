# Deploying alejandrotheband.com

Plain static page on GitHub Pages. Two repos, because free Pages only serves
from a **public** repo and the `anaheim` video can't be discoverable before
launch day, **October 20**:

| Repo | Visibility | Serves | When |
| --- | --- | --- | --- |
| [`alejandro-theband-holding`](https://github.com/ags2121/alejandro-theband-holding) | public | wordmark-only holding page | now → Oct 20 |
| `alejandro-theband-website` (this repo) | private | the full site | Oct 20 onward |

The holding repo is a clean, history-free copy of `index.html` (wordmark only),
`style.css`, `i/title.jpg`, `CNAME`. Nothing about the video lives in it.

## Status

- [x] Holding repo created, public, Pages enabled from `main`, build green.
- [x] Porkbun DNS — apex A records + `www` CNAME live, verified propagated.
- [x] TLS cert for the custom domain — issued (expires 2026-12-10). Took ~12h
      to auto-issue; GitHub's automation stalled and needed a manual nudge
      (clear + re-add the custom domain in Pages settings, or via API) to
      actually kick off issuance — if it stalls again next time, do that first.
- [x] HTTPS enforced on the holding repo.
- [ ] Oct 20 cutover (below).

`https://alejandrotheband.com` is live now, serving the wordmark-only holding
page.

## Step 1 — Porkbun DNS ✅ done

Porkbun dashboard for `alejandrotheband.com` → **DNS Records**:

1. **Delete** the parked-domain records (the preinstalled ALIAS/CNAME pointing at
   `*.porkbun.com` — currently resolves to `207.207.210.x`).
2. Add four **A** records, host blank (apex), answers:
   - `185.199.108.153`
   - `185.199.109.153`
   - `185.199.110.153`
   - `185.199.111.153`
3. Add one **CNAME** record, host `www`, answer `ags2121.github.io`.

Propagation is minutes to a few hours. GitHub then auto-verifies the domain and
issues the Let's Encrypt cert.

## Step 2 — enforce HTTPS ✅ done

```sh
gh api repos/ags2121/alejandro-theband-holding/pages -X PUT -F https_enforced=true
```

If the cert stalls (mine sat at GitHub's generic `*.github.io` cert for ~12h
with no progress), don't just wait — clear and re-add the custom domain to
force a fresh issuance:

```sh
gh api repos/ags2121/alejandro-theband-holding/pages -X PUT -F 'cname='
gh api repos/ags2121/alejandro-theband-holding/pages -X PUT -F 'cname=alejandrotheband.com'
```

This commits `CNAME` deletion/re-creation to the repo (harmless) and can leave
a stray "Page build failed" — an empty commit + push clears it:

```sh
git commit --allow-empty -m "trigger pages rebuild" && git push
```

## Step 3 — October 20 cutover (holding page → full site)

```sh
# 1. Free the custom domain from the holding repo (deleting the repo also does this)
gh api repos/ags2121/alejandro-theband-holding/pages -X DELETE

# 2. Make this repo public
gh repo edit ags2121/alejandro-theband-website --visibility public --accept-visibility-change-consequences

# 3. Enable Pages from main (the CNAME file in this repo re-claims the domain)
gh api repos/ags2121/alejandro-theband-website/pages -X POST -f 'source[branch]=main' -f 'source[path]=/'

# 4. After the cert re-issues (~15 min), enforce HTTPS
gh api repos/ags2121/alejandro-theband-website/pages -X PUT -F https_enforced=true

# 5. Clean up
gh repo delete ags2121/alejandro-theband-holding --yes
git push origin --delete holding
```

Also that day: flip the `anaheim` video from unlisted to public on YouTube.

## Leftover FIXMEs

The Listen section's **youtube** and **apple music** links point at google.com
with a visible `(FIXME)` marker until the real artist URLs exist. Edit
`index.html`, remove the `(FIXME)` text, push.
