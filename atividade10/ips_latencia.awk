# Correção: 1,0
{
    "ping -c 2 "$1" | grep min/avg/max/mdev | cut -f4 -d' ' | cut -f2 -d'/'" | getline media_ms
    medias[$1]=media_ms
}
    

END {
    for ( ip in medias ) 
    {   
        printf "%s %s ms \n", ip, medias[ip] | "sort -n -t' ' -k2"
    }
}
