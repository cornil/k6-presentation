$env:K6_WEB_DASHBOARD='true'
$env:K6_WEB_DASHBOARD_PERIOD='1s'
$env:K6_WEB_DASHBOARD_OPEN='true'

k6 run .\3_breakpoint.js