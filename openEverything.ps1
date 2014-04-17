foreach
($f in Get-ChildItem -recurse)
{
    Invoke-Item $f -filter *.exe
}