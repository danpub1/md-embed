BEGIN { numFiles=0; mode=0; customizeTheme=""; customizePage=""; content="" }

FNR == 1 { numFiles++; }

numFiles == 1 && $0 == "``````````customizeTheme" { mode = 1; }
numFiles == 1 && $0 == "``````````customizePage" { mode = 2; }
numFiles == 1 && $0 == "``````````" { mode = 0; }
numFiles == 1 && mode == 0 && $0 != "``````````" { content = content (content == "" ? "" : "\n") $0; }
numFiles == 1 && mode == 1 && $0 != "``````````customizeTheme" { customizeTheme = customizeTheme (customizeTheme == "" ? "" : "\n") $0; }
numFiles == 1 && mode == 2 && $0 != "``````````customizePage" { customizePage = customizePage (customizePage == "" ? "" : "\n") $0; }

# usage gawk -f md-embed.awk inputfile.md md-embed.html >tmp.html 
#       chromium --headless tmp.html --dump-dom >outputfile.html
numFiles == 2 && $0 ~ /<!-- EMBED @customizeTheme -->/ {
    print customizeTheme
}
numFiles == 2 && $0 ~ /<!-- EMBED @customizePage -->/ {
    print customizePage
}
numFiles == 2 && $0 ~ /<!-- EMBED @content -->/ {
    print content
}

numFiles == 2 { if ($0 !~ /<!-- EMBED @((content)|(customizeTheme)|(customizePage)) -->/) print; }