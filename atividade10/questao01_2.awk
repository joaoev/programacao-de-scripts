$5 ~ /sshd,*/ && $6 ~ /Accepted/ && $9 ~ /^j/ {
	print
}
