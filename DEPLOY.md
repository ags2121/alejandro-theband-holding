# Deploying alejandrotheband.com

The site is a plain static page served by GitHub Pages. The repo stays **private**
(nothing published) until launch day, **October 20** — the anaheim video can't be
public before then.

## Anytime before launch: Porkbun DNS

In the Porkbun dashboard for `alejandrotheband.com` → DNS Records:

1. **Delete** Porkbun's default parked-domain records (the preinstalled ALIAS/CNAME
   pointing at `pixie.porkbun.com`).
2. Add four **A** records, host blank (`alejandrotheband.com`), answers:
   - `185.199.108.153`
   - `185.199.109.153`
   - `185.199.110.153`
   - `185.199.111.153`
3. Add one **CNAME** record, host `www`, answer `ags2121.github.io`.

DNS can propagate ahead of time; nothing is served until Pages is enabled.

## On October 20: go live

```sh
# 1. Make the repo public
gh repo edit ags2121/alejandro-theband-website --visibility public --accept-visibility-change-consequences

# 2. Enable GitHub Pages from main (the CNAME file in the repo sets the custom domain)
gh api repos/ags2121/alejandro-theband-website/pages -X POST -f 'source[branch]=main' -f 'source[path]=/'

# 3. Once the site is up and GitHub has issued the TLS cert (can take ~15 min), enforce HTTPS
gh api repos/ags2121/alejandro-theband-website/pages -X PUT -F https_enforced=true
```

Also that day: flip the anaheim video from unlisted to public on YouTube.

## Leftover FIXMEs

The Listen section's **youtube** and **apple music** links point at google.com with
a visible `(FIXME)` marker until the real artist URLs exist. Edit `index.html`,
remove the `(FIXME)` text, and push.
