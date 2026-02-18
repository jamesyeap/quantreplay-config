#!/bin/sh

EXCHANGE="XNAS"
DATE="2026FEB18"

ID=$(curl -s -X GET http://localhost:9050/api/datasources | jq -r ".dataSources[] | select(.name == \"$EXCHANGE-$DATE\") | .id")
echo "Found ID: $ID"

curl -X PUT "http://localhost:9050/api/datasources/$ID" \
  -H "Content-Type: application/json" \
  -d "{
    \"enabled\": true,
    \"name\": \"$EXCHANGE-$DATE\",
    \"venueId\": \"$EXCHANGE\",
    \"connection\": \"/market-simulator/quod/data/rodata/$EXCHANGE/$DATE.csv\",
    \"format\": \"CSV\",
    \"type\": \"OrderBook\",
    \"repeat\": true,
    \"textDelimiter\": \",\",
    \"textHeaderRow\": 1,
    \"textDataRow\": 2
  }"

