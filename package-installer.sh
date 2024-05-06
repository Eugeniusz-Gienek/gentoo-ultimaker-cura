#!/bin/sh
mkdir -p /opt/ultimaker-cura
cd /opt/ultimaker-cura
python3.11 -m venv ./
source bin/activate
pip install conan==1.64.0
conan config install https://github.com/ultimaker/conan-config.git
conan profile new default --detect --force
conan profile update settings.compiler.libcxx=libstdc++11 default
git clone https://github.com/Ultimaker/Cura.git
cd Cura
conan install . --build=missing --update -o cura:devtools=True -g VirtualPythonEnv
source venv/bin/activate
