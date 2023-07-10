#!/usr/bin/env bash

set -e
set -x

cd ../../

wget --quiet https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_3.3.5-stable.zip
unzip -q flutter_macos_3.3.5-stable.zip
export PATH=`pwd`/flutter/bin:$PATH

flutter doctor

flutter pub get
flutter build apk --release --flavor $FLAVOR -t lib/main_$FLAVOR.dart

mkdir -p android/app/build/outputs/apk/; mv build/app/outputs/flutter-apk/app-$FLAVOR-release.apk $_
