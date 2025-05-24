uglifycss fonts.min.css base.css md-specific.css >md-embed.min.css
terser -c -m <md-embed.js >md-embed.min.js
# wget --quiet --unlink -O github.min.css https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.11.1/build/styles/github.min.css
gawk -f embed.awk md-embed-src.html >../release/md-embed.html
cp md-embed.min.css ../release
rm md-embed.min.js
rm md-embed.min.css
cp md-embed.awk ../release
cp md-embed.sh ../release
chmod +x ../release/md-embed.sh
../release/md-embed.sh md-embed-doc.md ../release