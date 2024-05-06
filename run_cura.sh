#!/bin/bash
cd /opt/ultimaker-cura
source bin/activate
cd Cura
source venv/bin/activate
nv=0
while test $# -gt 0
do
    case "$1" in
        --nvidia) nv=1
            ;;
    esac
    shift
done
if [ $nv -eq 1 ] then
    __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia python cura_app.py
else
    python cura_app.py
fi
