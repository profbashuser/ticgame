cat meta.nut >out/out.nut
echo >>out/out.nut
echo >>out/out.nut
echo "// GENERATED CODE, BE CAREFUL." >>out/out.nut
echo >>out/out.nut

for i in src/*.nut; do 
    printf "\e[1;94mIncluding $i\e[0m\n"
    # TODO: Fix tab
    cat $i \
        | grep -Ev '^ *\t' \
        | grep -Ev '^ *//' \
        | grep -Ev '^ *$' >>out/out.nut
done

printf "\e[1;92mOutput generated\e[0m\n"
