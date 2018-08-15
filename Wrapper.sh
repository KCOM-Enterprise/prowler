#!/usr/bin/env bash

./prowler >> output.txt

echo "output.txt"
cat output.txt

grep FAIL! output.txt >> failures.txt

echo "failures.txt"
cat failures.txt

aws sns publish --message file://failures.txt --topic-arn arn:aws:sns:eu-west-1:706032218050:best_sns

rm -f failures.txt
rm -f output.txt