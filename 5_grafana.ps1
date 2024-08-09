# go install go.k6.io/xk6/cmd/xk6@latest
# xk6 build --with github.com/grafana/xk6-output-influxdb

docker compose up -d

$env:K6_INFLUXDB_ORGANIZATION="rver"
$env:K6_INFLUXDB_BUCKET="k6"
$env:K6_INFLUXDB_TOKEN="TOKEN" 
$env:K6_INFLUXDB_ADDR="http://localhost:8086"

./k6 run --vus 1 --duration 1h 3_breakpoint.js -o xk6-influxdb
