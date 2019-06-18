#!/bin/bash

print_vulnerabilities () {
    ./jq-linux64 .metadata.vulnerabilities < ./audit_result.json
    cat ./audit_result.json
}

wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
chmod +x jq-linux64
npm i --package-lock-only
npm audit --json > audit_result.json

INFO_VUL="$(./jq-linux64 .metadata.vulnerabilities.info < ./audit_result.json)"
LOW_VUL="$(./jq-linux64 .metadata.vulnerabilities.low < ./audit_result.json)"
MODERATE_VUL="$(./jq-linux64 .metadata.vulnerabilities.moderate < ./audit_result.json)"
HIGH_VUL="$(./jq-linux64 .metadata.vulnerabilities.high < ./audit_result.json)"
CRITICAL_VUL="$(./jq-linux64 .metadata.vulnerabilities.critical < ./audit_result.json)"

if [ "$INFO_VUL" -ne "0" ]
then
    print_vulnerabilities
    exit 1
fi

if [ "$LOW_VUL" -ne "0" ]
then
    print_vulnerabilities
    exit 1
fi

if [ "$MODERATE_VUL" -ne "0" ]
then
    print_vulnerabilities
    exit 1
fi

if [ "$HIGH_VUL" -ne "0" ]
then
    print_vulnerabilities
    exit 1
fi

if [ "$CRITICAL_VUL" -ne "0" ]
then
    print_vulnerabilities
    exit 1
fi
