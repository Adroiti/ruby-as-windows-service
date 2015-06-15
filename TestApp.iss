[Setup]
AppName=TestApp
AppVersion=1.0
DefaultDirName={pf}\TestApp
DefaultGroupName=TestApp
OutputBaseFilename=TestAppInstaller

[Run]
Filename: "{app}\register.exe";

[UninstallRun]
Filename: "{app}\unregister.exe";

[Files]
Source: "register.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "unregister.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "service.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "ReadMe.txt"; DestDir: "{app}"; Flags: isreadme ignoreversion

[Icons]
Name: "{group}\Test Ruby Application"; Filename: "{app}\register.exe"; WorkingDir: "{app}"
Name: "{group}\View ReadMe File"; Filename: "{app}\ReadMe.txt"; WorkingDir: "{app}"