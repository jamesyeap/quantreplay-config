#!/bin/sh

EXCHANGE="XNAS"

curl -s -X POST "http://localhost:9050/api/store/$EXCHANGE"
cat $EXCHANGE-state.json

