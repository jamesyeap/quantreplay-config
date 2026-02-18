#!/bin/sh

EXCHANGE="XNAS"
DATE="2026FEB18"

curl -X POST http://localhost:9050/api/datasources \
  -H "Content-Type: application/json" \
  -d "{
    \"enabled\": true,
    \"name\": \"$EXCHANGE-$DATE\",
    \"venueId\": \"$EXCHANGE\",
    \"connection\": \"/market-simulator/quod/data/market-data/$EXCHANGE/$DATE.csv\",
    \"format\": \"CSV\",
    \"type\": \"OrderBook\",
    \"repeat\": true,
    \"textDelimiter\": \",\",
    \"textHeaderRow\": 1,
    \"textDataRow\": 2
  }"

