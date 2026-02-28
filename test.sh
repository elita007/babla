#!/bin/bash
# Basic test script for the babla repository

passed=0
failed=0

assert_file_exists() {
  if [ -f "$1" ]; then
    echo "PASS: $1 exists"
    passed=$((passed + 1))
  else
    echo "FAIL: $1 does not exist"
    failed=$((failed + 1))
  fi
}

assert_file_not_empty() {
  if [ -s "$1" ]; then
    echo "PASS: $1 is not empty"
    passed=$((passed + 1))
  else
    echo "FAIL: $1 is empty"
    failed=$((failed + 1))
  fi
}

echo "Running tests..."

assert_file_exists "biba"
assert_file_exists "maxresdefault.jpg"
assert_file_exists "maxresdefault.zip"
assert_file_not_empty "biba"
assert_file_not_empty "maxresdefault.jpg"
assert_file_not_empty "maxresdefault.zip"

echo ""
echo "Results: $passed passed, $failed failed"

if [ "$failed" -gt 0 ]; then
  exit 1
fi

echo "All tests passed!"
