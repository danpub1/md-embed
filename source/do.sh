uglifycss fonts.min.css base.css md-specific.css >md-embed.min.css
terser -c -m <md-embed.js >md-embed.min.js

sed -e '/^\s*<script /d' -e '/^\s*<\/script>/d' -e '/^\s*<body/s/ onload="onBodyLoad()"//' md-embed-src.html >md-content-src.html
sed -e '/<!-- BEGIN md-embed -->/rmd-embed.min.css' -e '/<!-- BEGIN md-embed -->/rmd-embed.min.js' -e '/<!-- BEGIN md-embed -->/{n;N;d}' md-embed-src.html | sed -e '/<!-- BEGIN md-embed -->/{n;s/^/        <style>/;s/$/<\/style>/;n;s/^/        <script>/;s/$/<\/script>/}' >../md-embed.html
sed -e '/<!-- BEGIN md-embed -->/rmd-embed.min.css' -e '/<!-- BEGIN md-embed -->/{n;d}' md-content-src.html | sed -e '/<!-- BEGIN md-embed -->/{n;s/^/        <style>/;s/$/<\/style>/}' >../md-content.html

rm md-embed.min.js
rm md-embed.min.css
rm md-content-src.html