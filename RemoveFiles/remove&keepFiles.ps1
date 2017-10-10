$path="C:\teste"
Get-ChildItem -Path $path *.* -Recurse | where { ! $_.PSIsContainer } | Sort {$_.LastWriteTime} -outvariable files

$keepsavefiles = 7
for ($i=0; $i -lt $files.Count - $keepsavefiles; $i++) {
    $outfile = $files[$i]
    #echo $outfile.FullName
    Remove-Item $outfile.FullName
}