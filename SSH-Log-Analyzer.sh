#!/bin/bash

log=$(journalctl -u sshd --no-pager -n 50)
if [[ -z "$log" ]];then
echo "Could not retrieve SSH logs!"
exit 1
fi

failed=$(printf '<%s>\n' "$log" | grep "Failed password" | wc -l)
accepted=$(printf '<%s>\n' "$log" | grep "Accepted password" | wc -l)

echo "failed attempts:$failed"
echo "accepted attempts:$accepted"

IPfailed=$(printf '<%s>\n' "$log" | grep "Failed password" | awk '{print $11}' | sort | uniq -c | sort -n)
IPaccepted=$(printf '<%s>\n' "$log" | grep "Accepted password" | awk '{print $11}' | sort | uniq -c | sort -n)

echo "ip(S) that can't login:$IPfailed"
echo "ip(S) that can login:$IPaccepted"

failed_attention=$(printf '<%s>\n' "$log" | grep "Failed password" | awk '{print $11}' | sort | uniq -c | sort -n |awk '$1>=3 {print "DANGER!: failed:", $1, $2}')
echo "$failed_attention"
