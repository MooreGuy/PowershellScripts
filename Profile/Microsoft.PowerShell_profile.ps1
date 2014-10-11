#Guys Profile, last edit 8/30/2014.
#SCRIPTPATH = "C:\Users\GuyMoore\Scripts"
$VIMPATH = "C:\Program Files (x86)\Vim\vim74\vim.exe"
$PYTHON27PATH = "C:\Python27\python27.exe"
$PYTHON34PATH = "C:\Python34\python.exe"
$SQLITEPATH = "C:\Program Files (x86)\SQLite\sqlite3.exe"
$ADBPATH = "C:\Users\GuyMoore\AppData\Local\android\android-sdk\platform-tools\adb.exe"
$FASTBOOTPATH = "C:\USers\GuyMoore\android-sks\platform-tools\adb.exe"

Set-Alias python27 $PYTHON27PATH
Set-Alias python $PYTHON34PATH
Set-Alias vi $VIMPATH
Set-Alias vim $VIMPATH
Set-Alias sqlite3 $SQLITEPATH
Set-Alias adb $ADBPATH
Set-Alias fastboot $FASTBOOTPATH

$host.UI.rawUI.BackgroundColor = "Black"
clear

Function Edit-Vimrc
{
    vim $home\_vimrc
}
