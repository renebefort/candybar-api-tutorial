$apiUrl = "http://127.0.0.1:8000/candybar"

$response = Invoke-RestMethod -Uri $apiUrl -Method Get

# Output as a grid/table
$response.candies.psobject.Properties | ForEach-Object {
    [PSCustomObject]@{
        Id     = $_.Value.id
        Name   = $_.Value.name
        Flavor = $_.Value.flavor
        Price  = $_.Value.price
    }
} | Format-Table -AutoSize