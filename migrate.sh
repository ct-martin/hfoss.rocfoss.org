#!/usr/bin/bash
find ../hfoss/ofcourse-content/people/ -name \*.yaml | while read f
do
    YEAR=$(echo "$f" | awk '{split($0, a, "/"); print a[5]}')
    SEM=$(echo "$f" | awk '{split($0, a, "/"); print a[6]}')
    NAME=$(echo "$f" | awk '{split($0, a, "/"); print a[7]}' | awk '{split($0, a, "."); print a[1]}')
    NEWDIR="./people/$YEAR/$SEM/_posts"
    if [ ! -d $NEWDIR ]
    then
        mkdir -p $NEWDIR
    fi
    NEWFILE="$NEWDIR/$YEAR-01-01-$NAME.md"
    echo "---" > $NEWFILE
    if [ '$(head -n 1 $f | grep -Eq "#hfoss")' ] # remove weird thing at start of some files
    then
        tail -n +2 $f >> $NEWFILE
    else
        cat $f >> $NEWFILE
    fi
    echo "" >> $NEWFILE # account for no newline at end of file
    echo "---" >> $NEWFILE
done