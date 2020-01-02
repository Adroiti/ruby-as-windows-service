# Ruby as Windows Service

Sample application consists of 3 parts:
- `register.rb` - creates and starts Windows Service
- `unregister.rb` - stops and removes Windows Service
- `service.rb` - performs main logic (write to log file every 10 seconds). Note `defined?(Ocra)` which is needed for OCRA setup.

The steps below describe how to make a Windows Installer package for sample ruby application which is installed as Windows Service. It is assumed that target machine does not have Ruby installed as a prerequisite.

1) Install [win32-service](https://github.com/djberg96/win32-service) and [OCRA](https://github.com/larsch/ocra) gems:
```ruby
gem install win32-service
gem install ocra
```
2) Install [Inno Setup](http://www.jrsoftware.org/isdl.php) and [add it](https://thommck.wordpress.com/2010/12/06/how-to-add-a-path-to-the-system-variables-in-windows-2008-r2/) to Windows PATH.

3) Package ruby files into Windows Executables using OCRA:
```ruby
ocra register.rb
ocra service.rb
ocra unregister.rb
```
4) Package executables into [Windows Installer](http://www.jrsoftware.org/ishelp/index.php?topic=setupcmdline) file:
```ruby
iscc TestApp.iss
```
5) Install `TestAppInstaller.exe` on target Windows machine.

Package executable creation tested on Windows 7 SP1 (x64). Installation tested on Windows Server 2008 SP2.
