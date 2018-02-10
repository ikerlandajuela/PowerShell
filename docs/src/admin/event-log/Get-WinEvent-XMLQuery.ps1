## Gets all Critical and Error events from the last 24 hours
$xml = @'
<QueryList>
	<Query Id="0" Path="System">
		<Select Path="System">
			*[System[(Level=1 or Level=2) and TimeCreated[timediff(@SystemTime) &lt;= 86400000]]]
		</Select>
	</Query>
</QueryList>
'@

Get-WinEvent -FilterXml $xml