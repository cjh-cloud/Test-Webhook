#!/bin/bash

npm ci
npm run build --if-present
VALID=$(npm test || true)
echo $VALID
PASSING="$(echo $VALID | grep -o '[0-9] failing')"

# If all tests pass, $PASSING will be empty
if [ -z "$PASSING" ]
then
  RESULTS="pass"
else
  RESULTS="fail"
fi

RES=$(curl --write-out '%{http_code}' --silent --output /dev/null -X POST -H "Content-Type: application/json" --data "{ \"data\": \"$RESULTS\" }"  $WEBHOOK_URL)

# If RESULTS is fail or curl returned 404, throw an error
if [ "$RES" != "200" ] 
then
  echo "*** Post failed"
  exit 64
elif [ $RESULTS = "fail" ]
then 
  echo "*** NPM Test failed"
  exit 64
fi
