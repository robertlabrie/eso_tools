# get nlua and keralua from nuget and extract locally
Add-Type -Assembly System.IO.Compression.FileSystem

wget https://www.nuget.org/api/v2/package/NLua/1.6.0 -OutFile nlua.zip
wget https://www.nuget.org/api/v2/package/KeraLua/1.3.1 -OutFile keralua.zip

# nlua
$zip = [IO.Compression.ZipFile]::OpenRead("$($pwd.Path)\nlua.zip")
$file = $zip.Entries | where {$_.FullName -eq 'lib/net46/NLua.dll' }
[IO.Compression.ZipFileExtensions]::ExtractToFile($file,"$($pwd.Path)\$($file.Name)")
$zip.Dispose()

# keralua
$zip = [IO.Compression.ZipFile]::OpenRead("$($pwd.Path)\keralua.zip")
$file = $zip.Entries | where {$_.FullName -eq 'lib/net46/KeraLua.dll' }
[IO.Compression.ZipFileExtensions]::ExtractToFile($file,"$($pwd.Path)\$($file.Name)")
$zip.Dispose()

$zip = [IO.Compression.ZipFile]::OpenRead("$($pwd.Path)\keralua.zip")
$file = $zip.Entries | where {$_.FullName -eq 'runtimes/win-x64/native/lua54.dll' }
[IO.Compression.ZipFileExtensions]::ExtractToFile($file,"$($pwd.Path)\$($file.Name)")
$zip.Dispose()

Remove-Item -Path .\nlua.zip
Remove-Item -Path .\keralua.zip