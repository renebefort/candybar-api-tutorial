$apiUrl = "http://127.0.0.1:8000/candybar"

$candies = @(
    @{ id = 1; name = "Choco Delight"; flavor = "Chocolate"; price = 2.5 },
    @{ id = 2; name = "Berry Blast"; flavor = "Strawberry"; price = 3.0 },
    @{ id = 3; name = "Nutty Crunch"; flavor = "Peanut"; price = 4.5 },
    @{ id = 4; name = "Caramel Joy"; flavor = "Caramel"; price = 2.9 },
    @{ id = 5; name = "Minty Fresh"; flavor = "Mint"; price = 1.8 }
)

foreach ($candy in $candies) {
    $json = $candy | ConvertTo-Json
    Invoke-RestMethod -Uri $apiUrl -Method Post -Body $json -ContentType "application/json"
    Write-Host "Added candy: $($candy.name)"
}