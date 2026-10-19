#!/bin/bash
# Content check for index.html — fails if required content is missing or pets leftovers remain.
set -u
f=index.html
fail=0

require() {
  grep -qF -- "$1" "$f" || { echo "MISSING: $1"; fail=1; }
}
forbid() {
  grep -qF -- "$1" "$f" && { echo "LEFTOVER: $1"; fail=1; }
}

[ -f "$f" ] || { echo "MISSING: $f"; exit 1; }

require '¡Con Gusto!'
require 'out 5 February 2027'
require 'https://alejandrotheband.bandcamp.com'
require 'youtube.com/embed/ubxWFNi0-Ow'
require 'video by jon campolo'
require 'anaheim'
require 'i/title.jpg'
require 'i/cover.jpg'
require 'i/band.jpg'
require 'alejandro is:'
require 'https://www.instagram.com/cjheesvsaen/'
require 'https://www.instagram.com/andycush/'
require 'https://www.instagram.com/ryan_el_solh/'
require 'https://www.instagram.com/hack_c/'
require 'https://alexsilvamusic.biz/'
require 'https://www.instagram.com/alejandro_theband/'
require 'https://www.tiktok.com/@alejandrotheband'
require 'alejandrotheband at gmail dot com'
require 'FIXME'

forbid 'petsportal.net'
forbid 'petsnyc'
forbid 'pets.nwhyc'
forbid 'pets.nyc'
forbid 'googletagmanager'
forbid 'ninaprotocol'
forbid 'merch'
forbid 'Merch'

[ "$fail" -eq 0 ] && echo OK
exit "$fail"
