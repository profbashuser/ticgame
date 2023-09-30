printf "Exporting cart..."

cp -r ./assets/assets.tic ./out
tic-80 \
    --fs="./out" \
    --skip \
    --cmd "load assets.tic & import code out.nut & save out.tic"