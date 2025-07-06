# DOS command curl

open DOS command line and paste

```batch
curl -X POST "http://127.0.0.1:8000/candybar" ^
  -H "accept: application/json" ^
  -H "Content-Type: application/json" ^
  -d "{\"id\":99,\"name\":\"ice-cream\",\"flavor\":\"nice\",\"price\":100}"
```