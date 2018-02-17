# https://www.jesusninoc.com/2018/02/09/importar-un-contenido-json-en-powershell/
$alumnos = '{
  "alumnos": {
    "alumno": [
      {
        "id": "1",
        "usuario": "juanito",
        "grupo": "ventas",
        "programa": "notepad",
        "directorio": "carpetatrabajo",
        "permisos": "leer"
      },
      {
        "id": "2",
        "usuario": "luis",
        "grupo": "ventas",
        "programa": "p7zip",
        "directorio": "carpetatrabajo",
        "permisos": "444"
      }
    ]
  }
}' | ConvertFrom-Json

$alumnos.alumnos.alumno | %{
    $_.usuario, $_.grupo
}