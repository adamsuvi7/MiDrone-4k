// Replaces user-visible hardcoded Chinese const-strings in smali with Indonesian.
// Each entry is checked against the expected Chinese text before replacing, so re-runs are no-ops.
// Usage (from PhoenixDrone4K/): node tools/patch_cn_strings.js
const fs = require('fs');
const path = require('path');

const B = 'smali/com/fimi/';
const P = [
  // [file, line, expected Chinese, Indonesian]
  ['soul/module/droneFragment/i.smali', 2498, '飞机将达到最大高度，请调节云台角度', 'Drone hampir mencapai ketinggian maksimum, atur sudut gimbal'],
  ['soul/module/droneFragment/i.smali', 2042, '度', '\\u00b0'],
  ['soul/module/droneTrack/PlayBackDroneTrackActivity.smali', 3891, '正在加载数据', 'Memuat data'],
  ['soul/module/dronemanage/g.smali', 161, '请设置指定航点', 'Tentukan titik waypoint terlebih dahulu'],
  ['soul/module/setting/c.smali', 197, '出厂设置', 'Setelan pabrik'],
  ['soul/module/setting/c.smali', 199, '恢复', 'Pulihkan'],
  ['soul/module/setting/c$1$1.smali', 65, '操作成功，中继重启', 'Berhasil, relay dimulai ulang'],
  ['soul/module/setting/c$1$1.smali', 77, '操作失败', 'Operasi gagal'],
  ['soul/module/setting/c$1$1.smali', 107, '操作失败', 'Operasi gagal'],
  ['soul/module/setting/c$3$1.smali', 59, '开始重启', 'Memulai ulang'],
  ['soul/module/setting/c$3$1.smali', 89, '重置失败，请检查是否连接遥控器', 'Reset gagal, periksa koneksi remote control'],
  ['soul/module/setting/c$5.smali', 59, '设置成功', 'Pengaturan berhasil'],
  ['soul/module/setting/c$5.smali', 89, '设置失败，请检查中继网络', 'Pengaturan gagal, periksa jaringan relay'],
  ['soul/module/droneFragment/ShowDroneUiFragment.smali', 3078, '张', ' foto'],
  ['soul/module/droneFragment/ShowDroneUiFragment$8.smali', 198, '0张', '0 foto'],
  ['soul/biz/k/t.smali', 354, '天气无法获取', 'Cuaca tidak tersedia'],
  ['kernel/utils/n.smali', 1236, '解析逻辑版本出错!', 'Gagal membaca versi firmware!'],
  ['kernel/utils/f.smali', 195, '分', ' mnt '],
  ['kernel/utils/f.smali', 205, '秒', ' dtk'],
  ['kernel/utils/f.smali', 229, '秒', ' dtk'],
  ['kernel/utils/f.smali', 250, '毫秒', ' ms'],
  ['kernel/utils/f.smali', 602, 'MM月dd日  HH:mm', 'dd/MM  HH:mm'],
  ['kernel/utils/f.smali', 901, '今天', 'Hari ini '],
  ['kernel/utils/f.smali', 969, '分钟前', ' menit lalu'],
  ['kernel/utils/f.smali', 984, '刚刚', 'Baru saja'],
  ['kernel/utils/f.smali', 1066, '星期日', 'Minggu'],
  ['kernel/utils/f.smali', 1101, '错误', 'Galat'],
  ['kernel/utils/f.smali', 1106, '星期日', 'Minggu'],
  ['kernel/utils/f.smali', 1111, '星期一', 'Senin'],
  ['kernel/utils/f.smali', 1116, '星期二', 'Selasa'],
  ['kernel/utils/f.smali', 1121, '星期三', 'Rabu'],
  ['kernel/utils/f.smali', 1126, '星期四', 'Kamis'],
  ['kernel/utils/f.smali', 1131, '星期五', 'Jumat'],
  ['kernel/utils/f.smali', 1136, '星期六', 'Sabtu'],
];

// Kept outside PhoenixDrone4K/ so apktool does not pack it into the APK.
const backupDir = path.join('..', 'backup_cn_strings');
const files = {};
let done = 0, skipped = 0, bad = 0;
for (const [rel, line, cn, id] of P) {
  const f = B + rel;
  if (!files[f]) files[f] = fs.readFileSync(f, 'utf8').split('\n');
  const L = files[f];
  const m = /^(\s*const-string(?:\/jumbo)? [vp]\d+, )"(.*)"(\s*)$/.exec(L[line - 1]);
  if (!m) { console.log('BAD  ', f + ':' + line, '| not a const-string'); bad++; continue; }
  const cur = JSON.parse('"' + m[2] + '"');
  if (cur === JSON.parse('"' + id + '"')) { skipped++; continue; }
  if (cur !== cn) { console.log('BAD  ', f + ':' + line, '| found:', cur); bad++; continue; }
  L[line - 1] = m[1] + '"' + id + '"' + m[3];
  done++;
}
if (bad) { console.log(`${bad} mismatch, nothing written.`); process.exit(1); }
for (const [f, L] of Object.entries(files)) {
  const bak = path.join(backupDir, f);
  if (!fs.existsSync(bak)) { fs.mkdirSync(path.dirname(bak), { recursive: true }); fs.copyFileSync(f, bak); }
  fs.writeFileSync(f, L.join('\n'));
}
console.log(`patched ${done}, already done ${skipped}, files ${Object.keys(files).length}, backup in ${backupDir}/`);
