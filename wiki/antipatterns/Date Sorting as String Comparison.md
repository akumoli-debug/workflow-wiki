---
type: antipattern
title: "Date Sorting as String Comparison"
created: 2026-04-20
updated: 2026-04-20
status: seed
severity: high
caught_in: "[[Deal Tracker Dashboard]]"
prevention: "Any sortable column that isn't a raw number needs explicit type coercion in the sort comparator."
tags:
  - antipattern
  - sorting
  - javascript
---

## What Happened

Dates stored as ISO strings ("2026-01-08"). Sort function uses `av - bv` to compare. JavaScript coerces strings to NaN via subtraction. `NaN - NaN` returns NaN. Sort silently produces wrong output. No console error. No crash. Just wrong order that looks plausible enough to ship.

## Root Cause

ISO date strings happen to sort correctly with `localeCompare()` or `<`/`>` operators (because YYYY-MM-DD is lexicographically ordered). But numeric subtraction (`a - b`) doesn't work on strings. The `Array.sort` comparator needs a number return value, and NaN causes undefined behavior in sort implementations.

## Fix

Convert to timestamps before comparison:

```javascript
if (sortKey === "dateSubmitted") {
  av = new Date(av).getTime();
  bv = new Date(bv).getTime();
}
return sortDir === "asc" ? av - bv : bv - av;
```

## Prevention

Add to review checklist: for every sortable column, verify the comparator handles the column's data type. Specifically:
- Numbers: `a - b` works directly
- Dates: convert to `getTime()` first
- Strings: use `localeCompare()`

This should be a standard check in [[Internal Dashboard Review Checklist]] under "Are the core mechanics correct?"

## Connections

- Rubric: [[Internal Dashboard Review Checklist]]
