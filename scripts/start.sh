#!/usr/bin/env bash

npx live-server --browser=google-chrome dist &
SERVER_PID=$!

npx nodemon \
    --exec "npm run build && http-server dist" \
    -w src -e js,ts,jsx,tsx,html,css \
    -w tailwind.config.js \
    &
BUILD_PID=$!

trap 'kill $BUILD_PID $SERVER_PID' INT

wait
