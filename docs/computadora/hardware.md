```powershell
$data = systeminfo.exe /FO CSV | ConvertFrom-Csv
$data | Out-GridView
```


# Enlaces externos

* [Using List View in a Grid View Window (Part 1)](http://community.idera.com/powershell/powertips/b/tips/posts/using-list-view-in-a-grid-view-window-part-1).
