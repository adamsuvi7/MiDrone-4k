#!/usr/bin/env bash
# CI build of this decompiled app (an apktool project) for the agent testers:
# the same apktool 2.10.0 + uber-apk-signer 1.3.0 as the local build (CLAUDE.md),
# pinned by SHA-256. Output: app-signed.apk in the repo root (apk_path).
set -euo pipefail
[ -n "${GITHUB_ACTIONS:-}" ] || { echo "CI only: it deletes lib/x86 and lib/x86_64 from the checkout"; exit 1; }
T="${RUNNER_TEMP:-/tmp}"
get() { curl -fsSL -o "$T/$2" "$1" && echo "$3  $T/$2" | sha256sum -c - >/dev/null; }
get https://github.com/iBotPeaches/Apktool/releases/download/v2.10.0/apktool_2.10.0.jar apktool.jar \
  c0350abbab5314248dfe2ee0c907def4edd14f6faef1f5d372d3d4abd28f0431
get https://github.com/patrickfav/uber-apk-signer/releases/download/v1.3.0/uber-apk-signer-1.3.0.jar signer.jar \
  e1299fd6fcf4da527dd53735b56127e8ea922a321128123b9c32d619bba1d835
# lib/x86 and lib/x86_64 hold 6 of the 18 native libraries (no AMap, player or TTS):
# the x86_64 emulator would pick them and crash on the map. Without them Android uses
# arm64-v8a through the emulator image's ARM translation (API 30+), like a real phone.
rm -rf lib/x86 lib/x86_64
# -f: build/apk/ tracked in git is stale, so rebuild everything from smali/ and res/
java -jar "$T/apktool.jar" b -f . -o "$T/raw.apk"
java -jar "$T/signer.jar" -a "$T/raw.apk" -o "$T/signed" --allowResign
cp "$T"/signed/*.apk app-signed.apk
