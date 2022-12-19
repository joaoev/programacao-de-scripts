#!bin/bash
# Nota: 1,0
grep -n -av sshd auth.log

grep -n "(sshd:session): session opened for user j" auth.log

grep -n -E 'sshd\[[0-9]{5}\]: (Failed|Failure|Disconnecting|Connection|Disconnected|Disconnecting|error:) [[:alnum:][:punct:][:blank:]]* root' auth.log

grep -n -E 'Oct (11|12) [[:alnum:][:punct:][:blank:]]* sshd\[[0-9]{5}\]: [[:alnum:][:punct:][:blank:]]* session opened' auth.log
