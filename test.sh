#!/bin/bash
set -e

mkdir -p test-results

echo "=== Running tests ==="

PASS=0
FAIL=0

run_test() {
  local name="$1"
  local expected="$2"
  local actual="$3"

  if [ "$expected" = "$actual" ]; then
    echo "PASS: $name"
    PASS=$((PASS + 1))
  else
    echo "FAIL: $name (expected '$expected', got '$actual')"
    FAIL=$((FAIL + 1))
  fi
}

# Test greet function
result=$(python3 -c "from src.app import greet; print(greet('Alice'))")
run_test "greet returns correct string" "Hello, Alice!" "$result"

# Test add function
result=$(python3 -c "from src.app import add; print(add(2, 3))")
run_test "add returns correct sum" "5" "$result"

result=$(python3 -c "from src.app import add; print(add(-1, 1))")
run_test "add handles negatives" "0" "$result"

# Write results
echo "{\"passed\": $PASS, \"failed\": $FAIL}" > test-results/results.json

echo ""
echo "=== Results: $PASS passed, $FAIL failed ==="

if [ $FAIL -gt 0 ]; then
  exit 1
fi
