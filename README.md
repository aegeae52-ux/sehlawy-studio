# designhub-releases

الإصدارات الرسمية العامة وإعدادات التحديث لإضافة Design Hub لفوتوشوب.
Official public releases and update configuration for the Design Hub Photoshop extension.

## محتويات الريبو

| الملف | الوظيفة |
|---|---|
| `plugin-config.json` | يحدد آخر إصدار، التحديث الإجباري، ونسبة الطرح (rollout) |
| `updates.json` | سجل الإصدارات وملاحظاتها بالعربي والإنجليزي (تعرضه صفحة التحديثات داخل الإضافة) |
| `generate_updates.py` | سكريبت يولّد `updates.json` من البيانات المكتوبة بداخله |
| `installer.iss` | سكريبت Inno Setup لبناء ملف التثبيت `.exe` |
| `.github/workflows/release.yml` | يبني الـ exe وينشر Release تلقائياً عند رفع tag جديد |
| `RELEASE_TEMPLATE.md` | قالب ملاحظات الإصدار |
| `CHANGELOG.md` | سجل التغييرات |

## خطوات نشر إصدار جديد

1. حدّث `generate_updates.py` بإضافة الإصدار الجديد أول القائمة `updates` وغيّر `latest`، ثم شغّل:
   ```
   python generate_updates.py
   ```
2. حدّث `plugin-config.json` (`latestVersion` و`downloadUrl` و`rolloutPercent` و`force`).
3. حدّث `AppVersion` في `installer.iss`.
4. ارفع التغييرات، ثم أنشئ tag وارفعه:
   ```
   git tag v1.12.10
   git push origin v1.12.10
   ```
5. GitHub Actions يبني الـ exe وينشر الـ Release تلقائياً.

## الطرح التدريجي (Rollout)

ابدأ بـ `rolloutPercent: 10` ثم ارفعها تدريجياً لـ `100` لو مفيش مشاكل.
منطق الطرح بيتنفذ داخل الإضافة، GitHub بس بيخزن الملف.
