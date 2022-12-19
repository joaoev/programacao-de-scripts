
$1 ~ /Oct/ && $2 ~ /(11|12)/ && $5 ~ /sshd*/ && $7 ~ /session/ && $8 ~ /opened/ {
        print
}
