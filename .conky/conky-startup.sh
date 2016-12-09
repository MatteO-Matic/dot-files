sleep 20s
killall conky
cd "~/.conky/Gotham"
conky -c "~/.conky/Gotham/Gotham" &
cd "~/.conky/TeejeeTech"
conky -c "~/.conky/TeejeeTech/Network Panel" &
cd "~/.conky/TeejeeTech"
conky -c "~/.conky/TeejeeTech/Process Panel" &
