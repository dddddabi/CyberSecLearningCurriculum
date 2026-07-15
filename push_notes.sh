#!/usr/bin/env bash
LOG_FILE="scratchpad.md"

clear
echo "============================================="
echo "        INPUT DAILY CYBERSEC LOG             "
echo "============================================="
echo "Paste your multi-line notes below."
echo "Type 'EOF' on a new line and press Enter to finish."
echo "---------------------------------------------"

USER_INPUT=""
while IFS= read -r line; do
    if [[ "$line" == "EOF" ]]; then
        break
    fi
    USER_INPUT+="$line\n\n"
done

if [ -z "$USER_INPUT" ]; then
    echo "Notice. Empty input detected. Aborting."
    sleep 2
    exit 1
fi

echo -e "\n### $(date +'%Y-%m-%d %H:%M')\n$USER_INPUT" >> "$LOG_FILE"

git add .
git commit -m "sync: $(date +'%Y-%m-%d %H:%M:%S')"
git push

echo "Notice. Remote synchronization complete."
sleep 2