# This can be used as a template, just change a few file extensions and regex(es)

GIT_REPO="https://github.com/profbashuser/ticgame"

cat meta.nut >out/out.nut
echo >>out/out.nut
echo >>out/out.nut
echo "// GENERATED CODE, BE CAREFUL." >>out/out.nut
echo "// See repo here: $GIT_REPO" >>out/out.nut
echo >>out/out.nut

for i in src/*.nut; do
	# TODO: Fix tab
	if [[ "$i" != "src/main.nut" ]]; then
	printf "\e[1;94mIncluding $i\e[0m\n"
	cat $i \
		| tr -d '\t' \
		| grep -Ev $'^ *//' \
		| grep -Ev $'^ *$' >>out/out.nut
	fi
done

# Add main last
printf "\e[1;94mIncluding src/main.nut\e[0m\n"
cat src/main.nut \
	| tr -d '\t' \
	| grep -Ev $'^ *//' \
	| grep -Ev $'^ *$' >>out/out.nut

printf "\e[1;92mOutput generated\e[0m\n"
size=$(wc -m < out/out.nut) # Get characters
printf "\e[1;91mComprimed size:$size/65536\e[0m\n"
