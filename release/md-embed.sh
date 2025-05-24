OUTPUTPATH=$2
if [ -z $OUTPUTPATH ]; then
    OUTPUTPATH=.
fi
HTMLFILE=$OUTPUTPATH/$(basename $1).html
CONTENTFILE=$OUTPUTPATH/$(basename -s .md $1).html
SCRIPTPATH=$(dirname $0)
gawk -f $SCRIPTPATH/md-embed.awk $1 $SCRIPTPATH/md-embed.html >$HTMLFILE
chromium --headless --dump-dom $HTMLFILE >$CONTENTFILE
