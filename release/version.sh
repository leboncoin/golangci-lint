#!/bin/sh

echo "STABLE_VERSION" "${VERSION:-master}"

echo "SHORT_COMMIT" "$(git rev-parse --short "HEAD")"
echo "BUILD_DATE" "$(date -u +%Y-%m-%dT%H:%M:%SZ)"

echo "GO_VERSION" "go1.21.3"
