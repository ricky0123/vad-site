#!/usr/bin/env bash

rm -rf dist
mkdir dist

cp src/*.html dist
npx tailwindcss -i ./src/input.css -o ./dist/style.css
npx esbuild src/demo.tsx --bundle --outfile=dist/demo.js --format=esm
cp \
    node_modules/@ricky0123/vad-web/dist/silero_vad.onnx \
    node_modules/@ricky0123/vad-web/dist/vad.worklet.bundle.min.js \
    node_modules/onnxruntime-web/dist/*.wasm \
    dist
