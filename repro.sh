#!/usr/bin/env bash
echo "deleting imagetools cache"
rm -rf node_modules/.cache/imagetools
echo "deleting image copies from previous run"
rm -rf ./src/images/temp*
mkdir ./src/images/temp1
mkdir ./src/images/temp2
mkdir ./src/images/temp3
mkdir ./src/images/temp
# create 2000 copies of img.png in ./src/images/temp
./scripts/duplicate_many.sh ./src/images/img.png ./src/images/temp1 2
./scripts/duplicate_many.sh ./src/images/temp1 ./src/images/temp2 5
./scripts/duplicate_many.sh ./src/images/temp2 ./src/images/temp3 10
./scripts/duplicate_many.sh ./src/images/temp3 ./src/images/temp 20
rm -r ./src/images/temp1
rm -r ./src/images/temp2
rm -r ./src/images/temp3
echo "created $(find ./src/images/temp -type f | wc -l) images in ./src/images/temp"
pnpm build
