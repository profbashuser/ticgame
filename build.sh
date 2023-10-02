# This can be used as a template, just change a few file extensions and regex(es)

GIT_REPO="https://github.com/profbashuser/ticgame"

cat meta.nut >out/out.nut
echo >>out/out.nut
echo >>out/out.nut
echo "// GENERATED CODE, BE CAREFUL." >>out/out.nut
echo "// See repo here: $GIT_REPO" >>out/out.nut
echo >>out/out.nut

for i in src/*.nut; do
	if [[ "$i" != "src/main.nut" ]]; then
	printf "\e[1;94mIncluding $i\e[0m\n"
	cat $i >> out/uncomp.nut
	cat $i \
		| tr -d '\t' \
		| grep -Ev $'^ *//' \
		| grep -Ev $'^ *$' >>out/out.nut
	fi
done

# Add main last
printf "\e[1;94mIncluding src/main.nut\e[0m\n"
cat src/main.nut >>out/uncomp.nut
cat src/main.nut \
	| tr -d '\t' \
	| grep -Ev $'^ *//' \
	| grep -Ev $'^ *$' >>out/out.nut

printf "\e[1;92mOutput generated\e[0m\n"

# Compressed size
size=$(wc -m < out/out.nut) # Get characters
printf "\e[1;91mCompressed size:$size/65536\e[0m\n"

# Uncompressed Size
size=$(wc -m < out/uncomp.nut) # Get characters (again)
printf "\e[1;91mUncompressed size:$size/65536\e[0m\n"
rm out/uncomp.nut
