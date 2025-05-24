function readfile(file,     tmp, save_rs)
{
    save_rs = RS
    RS = "^$"
    getline tmp < file
    close(file)
    RS = save_rs

    return tmp
}

/<!-- EMBED [A-Za-z.-]+ -->/ {
    match($0, /<!-- EMBED ([A-Za-z.-]+) -->/, arr)
    vv = readfile(arr[1])
    vv = gensub(/\\/, "\\\\", "g", vv)
    vv = gensub(/&/, "\\\\&", "g", vv)
    $0 = gensub(/<!-- EMBED [A-Za-z.-]+ -->/, vv, "g", $0)
}

{ print; }