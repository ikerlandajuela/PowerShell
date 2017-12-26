function New-Directory
{
	New-Item -ItemType Directory -Name "MyNewDir"
} #end New-Directory

New-Directory


function New-Directory-Ext($dirName)
{
	New-Item -ItemType Directory -Name $dirName
} #end New-Directory-Ext

New-Directory-Ext "MyDir1"
New-Directory-Ext "MyDir2"
