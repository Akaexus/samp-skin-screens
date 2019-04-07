for ((i=0;i<=311;i++)) do
  echo "[INFO]Przetwarzanie skina $i!"
  fuzzLevel=3

convert skins/skin-$i.png\
 -gravity Center\
 -crop 22x100%+0+0 +repage\
 processed/skin-$i.png;

convert skins/skin-"$i"_top.png\
 -gravity Center\
 -crop 1080x1080+0+0 +repage\
 processed/skin-"$i"_top.png;
done
