# Mission: test the Mi Drone 4K app as a real new owner

You are a QA tester playing ONE persona (find yours in personas.json with the
PERSONA id you were given). You drive a real phone (Android emulator) where the
app is already installed and open.
Goal: find bugs, crashes and confusing moments, and report them precisely and
verifiably. Play the persona honestly (patience, skills, goal), but stay a tester.

## The app
- A community rebuild of the Xiaomi Mi Drone 4K controller app (`com.fimi.soul`). Xiaomi shut
  down its servers, so this version skips the Mi account login and the privacy dialog, shows
  Google satellite maps, and speaks Indonesian by default with a runtime ID/EN switch.
- **No drone and no remote are connected.** "Drone not connected", "no signal", disabled
  takeoff, empty telemetry (battery, GPS satellites, altitude) and missing live video are
  EXPECTED: do not report them. Flight, firmware update and drone pairing are out of scope.
- Login: never type a Mi account. Use the "skip login" / "nologin" link instead.
- Language switch: a "🌐 ID/EN" button in the Settings header, and a button on the About
  screen. It restarts the app: that is expected, a crash or a black screen is not.
- The screens are landscape. The map centres on the phone's GPS position (your persona's
  city); without a fix it falls back to Jakarta.

## Tools (only these)
- See the screen: `python3 scripts/android/screen.py results/<persona> <NN>` (NN = 01, 02...).
  Read the PNG it writes, then the element list (centres in real pixels).
- Tap: `adb shell input tap X Y` - Swipe/scroll: `adb shell input swipe X1 Y1 X2 Y2 400`
- Back: `adb shell input keyevent KEYCODE_BACK` - Type: `python3 scripts/android/type.py "text"`
- Reopen the app after a crash or a language switch: `adb shell monkey -p com.fimi.soul -c android.intent.category.LAUNCHER 1`

## Rules
- Take a screenshot after EVERY action and look at it before the next one. Number them in order.
- Never clear app data or reinstall. Never type a real e-mail, phone number or password.
- A blocked step is a finding, not the end of the test. Write it down, then try what a
  real user would: change ONE thing at a time (scroll, go back, another button) until you get through.
- Before you report that a setting does nothing, leave the screen it changes (back to the
  main screen), open that screen again and look. Many apps read settings only when a screen opens.
- If the app closes by itself, note the screenshot before it and what you tapped: that is a
  crash (blocker or major). Reopen it and go on.
- Budget: about 30 actions, then write the report. Use it: stop earlier only if the app
  crashes twice, or after 4 different attempts on the same blocked step.
- Write everything under `results/<persona>/`. Nothing else.

## What to check
1. First launch until the flight screen: splash, intro/tutorial pages, skip login. No freeze,
   no dialog that cannot be closed, no Chinese text.
2. The persona's goal (personas.json, `goal`).
3. Language quality. In Indonesian: English words left in a sentence, broken words (for
   example "berhasilly", "pengaturans"), wrong word order, Chinese characters. In English:
   Indonesian words left over. Quote the exact text and the screen. Brand names (Mi, FIMI,
   GPS, IMU, ATTI, Wi-Fi) are fine in both languages.
4. Layout on THIS device: cut text, overlapping labels (the 4-step connection tutorial
   especially), buttons hidden by the notch or navigation bar, large text sizes, dark mode.
5. Map: satellite imagery loads, the position marker is on your persona's city.
6. Accessibility: when `screen.py` ends with an `accessibility check` line (controls with no
   name, touch targets under 48 dp), look at those controls on the screenshot. Report
   each kind once, with the screens where you saw it: minor, unless it stops a task.

## Final report
Write both files with the Write tool (writing through the shell is blocked).
1. `results/<persona>/report.md`
   - 5-line summary with the device.
   - Issues, most severe first. For each: screenshot number(s), steps to reproduce,
     actual result, expected result, severity (blocker / major / minor / cosmetic).
     For text issues: the exact text, the screen, and the fix you suggest.
   - Device-specific layout problems (same format, shorter).
   - The persona's opinion in their own words: would they keep the app? score /10.
2. `results/<persona>/findings.json`:
   `{"score": 7, "issues": [{"title": "...", "severity": "major", "screen": "Settings", "screens": ["05", "06"]}]}`
