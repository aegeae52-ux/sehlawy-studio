; Inno Setup script - Design Hub installer (template)
; عدّل مسارات الملفات حسب مشروعك
#define MyAppName "Design Hub"
#define MyAppVersion "1.12.9"
#define MyAppPublisher "Design Hub"

[Setup]
AppId={{REPLACE-WITH-YOUR-OWN-GUID}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
; تثبيت بدون صلاحيات Administrator
PrivilegesRequired=lowest
DefaultDirName={userappdata}\DesignHub
DisableDirPage=yes
OutputDir=dist
OutputBaseFilename=DesignHub-{#MyAppVersion}
Compression=lzma2
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "arabic"; MessagesFile: "compiler:Languages\Arabic.isl"
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
; ملفات إضافة CEP (فوتوشوب القديم)
Source: "build\cep\*"; DestDir: "{userappdata}\Adobe\CEP\extensions\DesignHub"; Flags: recursesubdirs ignoreversion
; ملفات إضافة UXP (فوتوشوب 23.3+)
Source: "build\uxp\*"; DestDir: "{userappdata}\DesignHub\uxp"; Flags: recursesubdirs ignoreversion

[Registry]
; السماح بتحميل إضافات CEP غير الموقعة (لو احتجت)
Root: HKCU; Subkey: "Software\Adobe\CSXS.9"; ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"
Root: HKCU; Subkey: "Software\Adobe\CSXS.10"; ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"
Root: HKCU; Subkey: "Software\Adobe\CSXS.11"; ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"
