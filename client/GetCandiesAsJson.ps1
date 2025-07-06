$apiUrl = "http://127.0.0.1:8000/candybar"

$response = Invoke-RestMethod -Uri $apiUrl -Method Get
$response | ConvertTo-Json -Depth 5 | Write-Host