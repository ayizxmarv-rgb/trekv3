#!/bin/bash

echo -n "Masukkan nilai lama: "
read lama

echo -n "Masukkan nilai baru: "
read baru

# Escape /, &, dan . agar tidak bermasalah di sed
lama_esc=$(printf '%s\n' "$lama" | sed -e 's/[\/&.]/\\&/g')
baru_esc=$(printf '%s\n' "$baru" | sed -e 's/[\/&]/\\&/g')  # titik tidak perlu di-escape di bagian "baru"

# Jalankan sed secara rekursif, kecuali folder .git
find . -type d -name '.git' -prune -o -type f -exec sed -i "s#$lama_esc#$baru#g" {} +