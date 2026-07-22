clean_hex=$(echo "$1" | tr -d ' ')
payload_hex="${clean_hex:4}"
pure_code=$(echo $payload_hex | xxd -r -p)
echo $pure_code
