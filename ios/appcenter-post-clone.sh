#!/usr/bin/env bash

set -e
set -x

cd ..

wget --quiet https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_3.3.5-stable.zip
unzip -q flutter_macos_3.3.5-stable.zip
export PATH=`pwd`/flutter/bin:$PATH

flutter doctor

echo "Installed flutter to `pwd`/flutter"

flutter pub get

flutter build ios --flavor $FLAVOR -t lib/main_$FLAVOR.dart --release --no-codesign