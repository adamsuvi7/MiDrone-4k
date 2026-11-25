# Mi Drone 4K (Phoenix Drone) — Claude Code Project Guide

> **Root Workspace Guide:** Also see [../CLAUDE.md](../CLAUDE.md) and [../RECONSTRUCTION_PROGRESS.md](../RECONSTRUCTION_PROGRESS.md).
> **Current State:** **v8 Release** (built, signed, and deployed to `../PhoenixDrone4K-Indonesia.apk`; v7 rollback in `../PhoenixDrone4K-Indonesia-v7-backup.apk`; field test pending).

## Quick Reference
- **Package:** `com.fimi.soul` (`V 3.1.67.1` / `versionCode 367`, `targetSdkVersion 24`)
- **Build Raw APK (from parent `scratch/` dir):**
  `.\jre\jdk-17.0.12+7-jre\bin\java.exe -jar apktool.jar b PhoenixDrone4K -o PhoenixDrone4K-Indo-raw.apk`
- **Sign APK (from parent `scratch/` dir):**
  `.\jre\jdk-17.0.12+7-jre\bin\java.exe -jar uber-apk-signer-1.3.0.jar -a PhoenixDrone4K-Indo-raw.apk -o signed_indo --allowResign`
- **Verify Strings Before Build (from parent `scratch/` dir):**
  `node check_strings.js ; node check_en.js ; node check_xml_errors.js`
- **Warning:** Do NOT leave large backup files inside `PhoenixDrone4K/` — keep backups/docs in parent `scratch/` so `apktool b` stays clean. Keep `PhoenixDrone4K-Master-v1.apk` in parent `scratch/` untouched as fallback baseline.

## Key Modified & Added Files Inside `PhoenixDrone4K/`
- `AndroidManifest.xml` — `CHANGE_NETWORK_STATE`, `max_aspect=2.8`, `notch_support=true`, `resizeableActivity=true`, `xlargeScreens=true`, removed `USB_DEVICE_ATTACHED` hijack on `LaunchedActivity`, added `usesCleartextTraffic` & `requestLegacyExternalStorage`.
- `res/values/` + `res/values-id/` + `res/values-in/` (1,265 strings pure Indonesian, kept identical; 855 translated in v8) & `res/values-en/` (pure English).
- `res/layout/fragment_usbconnect.xml` — Fixed Item 4 text overlap with Wi-Fi / Next buttons (`84.0%`).
- `res/layout/fragment_login.xml` — Visible `nologin_tv`.
- `res/layout/activity_about.xml` — About-screen language switcher (`@id/scoreBtn`). `res/layout/settingheardview.xml` is back to original in v8 (shared with `GimalTuneParameterActivity`'s Reset Gimbal button); the Settings "🌐 ID/EN" label is set at runtime in `MapSettingFragment.smali`.
- `smali/com/fimi/soul/biz/map/GoogleTileProvider.smali` (+ `$CellCallback.smali`) — Google Hybrid tiles + cellular network routing over relay Wi-Fi.
- `smali/com/fimi/soul/biz/IndoVoiceAssistant.smali` — Proactive TTS Co-Pilot with landing single-shot latch (`landingSpoken`/`landedSpoken`) + `com/fimi/kernel/d/b.smali` hook + `ShowDroneStatusFragment.smali` hooks. v8: battery % = `y().g()*100/J().e()`, IMU/GPS status from FC flags `an().s()`/`an().L()`, `QUEUE_ADD`, bilingual `speak()` + `toEnglish()` table (add every new phrase there).
- `smali/com/fimi/soul/biz/LanguageManager.smali` — Runtime ID/EN switcher hooked in `DroidPlannerApp.smali`, `BaseActivity.smali`, `MapSettingFragment.smali`, `AboutActivity$2.smali`. v8: restarts the task instead of `recreate()` and refuses while airborne.
- `smali/com/fimi/soul/base/BaseActivity.smali` — Sticky immersive fullscreen (`hideNavigationBar()` in `onCreate`, `onResume`, `onWindowFocusChanged`) + locale apply.
- `smali/com/fimi/soul/module/droneui/DroneMap.smali` + `FlightMapFragment.smali` + `PalyBackMapFragment.smali` — Attach `GoogleTileProvider`, phone GPS center fallback to Jakarta (`-6.2088, 106.8456`, zoom `15.0f`).
- `smali/com/fimi/soul/utils/ac.smali` — Bypassed GCJ-02 Mars shift (WGS-84 1:1 precision).
- `smali/com/fimi/soul/module/dronemanage/e.smali` — Auto-zoom satellite threshold lowered (`>= 2` / `> 1`).
- `smali/com/fimi/soul/drone/i/al.smali` & `ShowDroneControlFragment.smali` — ATTI / NewHand unlock.
- `smali/com/fimi/soul/module/droneui/BatteryInfoActivity.smali` — Battery SMBus telemetry trigger (`e/f;->i()`).
- `smali/com/fimi/soul/module/droneui/IMU4KActivity.smali` — v8 `e()Z`: allowed when the cached FC version is unknown/offline or `>= 1067`, `fc_update_tip` only when really `< 1067`; `onDestroy` stops the static IMU poll timer.
- `smali/com/fimi/soul/module/login/*` & `com/fimi/kernel/c/c.smali` & `InitAppService.smali` — Full login + Disclaimer/Terms bypass (`USER_PROTOCOL = true`).
- `smali/com/amap/api/mapcore/util/{ez,f}.smali` & `biz/n/k.smali` — AMap key check bypass & geocoding off; v8 `setOffset(false)` keeps the phone fix in WGS-84.
- `tools/patch_cn_strings.js` — Patches 34 remaining hardcoded Chinese Smali strings (applied & idempotent).
