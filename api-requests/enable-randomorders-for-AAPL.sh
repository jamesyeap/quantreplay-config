#!/bin/sh

HOST="localhost"
PORT="9050"
TICKER="AAPL"

curl -X PUT "http://$HOST:$PORT/api/listings/$TICKER" \
  -H "Content-Type: application/json" \
  -d '{
    "enabled" : true,
    "randomOrdersEnabled" : true
  }'

