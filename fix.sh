#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/godot/project"
    exit 1
fi

PROJECT="$1"

echo "---- Starting Auto Fix ----"

# Backup files
echo "[+] Backing up files..."
cp "$PROJECT/menu.gd" "$PROJECT/menu.gd.bak"
cp "$PROJECT/GlobalVariables.gd" "$PROJECT/GlobalVariables.gd.bak"

############################
# Fix GlobalVariables.gd
############################

echo "[+] Patching GlobalVariables.gd..."

# Ensure __cmGH never stays empty
sed -i '/var __cmGH = \[\]/a\
# Auto-init fix\
if __cmGH.is_empty():\
    __cmGH.append({ "__SXc7": "Default Pack", "__Okfs": [] })\
' "$PROJECT/GlobalVariables.gd"

############################
# Patch menu.gd functions
############################

echo "[+] Adding safety guards to menu.gd..."

# Insert early return guard into __kx99
sed -i '/func __kx99()/a\
    if GlobalVariables.__cmGH.is_empty():\
        return\
' "$PROJECT/menu.gd"

# Insert early return guard into __pOnt
sed -i '/func __pOnt()/a\
    if GlobalVariables.__cmGH.is_empty():\
        return\
' "$PROJECT/menu.gd"

# Insert early return guard into __ZYHE
sed -i '/func __ZYHE()/a\
    if GlobalVariables.__cmGH.is_empty():\
        return\
' "$PROJECT/menu.gd"

echo "---- Fix Complete ----"
echo "Backups created:"
echo "  menu.gd.bak"
echo "  GlobalVariables.gd.bak"
echo ""
echo "You can now re-run the project safely."
