cat meta.nut >out/out.nut
echo >>out/out.nut
echo >>out/out.nut
echo "// GENERATED CODE, BE CAREFUL." >>out/out.nut
echo >>out/out.nut

for i in src/*.nut; do
    # TODO: Fix tab
    if [[ "$i" != "src/main.nut" ]]; then
    printf "\e[1;94mIncluding $i\e[0m\n"
        cat $i \
        | grep -Ev $'^ *//' \
        | grep -Ev $'^ *$' >>out/out.nut
    fi
done

# Add main last
printf "\e[1;94mIncluding src/main.nut\e[0m\n"
cat src/main.nut \
    | grep -Ev $'^ *//' \
    | grep -Ev $'^ *$' >>out/out.nut

printf "\e[1;92mOutput generated\e[0m\n"
