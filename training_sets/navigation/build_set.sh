#!/bin/zsh

rm -f ./combined.js-to-lua.txt 2> /dev/null

while IFS="|" read js lua
do
    echo "$js\t\t$lua"
    # Remove Comments | Remove single-line comments | Add <EOL> to end of line | Strip line endings | Dedupe <EOL> | Add whitespace around punctuation | Expand Brackets | Ditto | Dedupe spaces
    # xJS=`cat $js | sed "/\/\*.*\*\//d;/\/\*/,/\*\// d" | sed -E 's/\/\/.*//g' | sed '$!s/$/ \<EOL\> /' | tr -d '\n' | sed -E 's/(<EOL>)+\1/\1/g' | sed -E 's/([\(|\)|\{|\}|\;|\,\.\:])/ \1 /g' |  sed -E 's/\[/ [ /g' | sed -E 's/\]/ ] /g' | sed -E 's/[ ]{2,}/ /g'`
    xJS=`cat $js | sed "/\/\*.*\*\//d;/\/\*/,/\*\// d" | sed -E 's/\/\/.*//g' | sed '$!s/$/ \ /' | tr -d '\n' | sed -E 's/(<EOL>)+\1/\1/g' | sed -E 's/([\(|\)|\{|\}|\;|\,\.\:])/ \1 /g' |  sed -E 's/\[/ [ /g' | sed -E 's/\]/ ] /g' | sed -E 's/[ ]{2,}/ /g' | sed -E 's/\. \. \./\.\.\. /g'`
    # Remove comments | Remove Comments | Replace line breaks with <EOL> | Strip line endings | Dedupe Line Endings | convert tabs to single space | Add whitespace around punctuation | <- And square brackets | Ditto | Dedupe spaces
    # xLUA=`cat $lua | sed "/\/\*.*\*\//d;/\/\*/,/\*\// d" | sed -E 's/--.*//g' | sed '$!s/$/ \<EOL\> /' | tr -d '\n' | sed -E 's/(<EOL>)+\1/\1/g' | sed -E $'s/\t/ /g' | sed -E 's/([\(|\)|\{|\}|\;|\,\.\:])/ \1 /g' | sed -E 's/\[/ [ /g' | sed -E 's/\]/ ] /g' | sed -E 's/[ ]{2,}/ /g'`
    xLUA=`cat $lua | sed "/\/\*.*\*\//d;/\/\*/,/\*\// d" | sed -E 's/--.*//g' | sed '$!s/$/ \ /' | tr -d '\n' | sed -E 's/(<EOL>)+\1/\1/g' | sed -E $'s/\t/ /g' | sed -E 's/([\(|\)|\{|\}|\;|\,\.\:])/ \1 /g' | sed -E 's/\[/ [ /g' | sed -E 's/\]/ ] /g' | sed -E 's/[ ]{2,}/ /g' | sed -E 's/\. \. \./\.\.\. /g'`
    echo "$xJS\t$xLUA" >> combined.js-to-lua.txt
done

ls -alh