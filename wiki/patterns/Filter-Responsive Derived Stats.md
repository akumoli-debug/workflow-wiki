---
type: pattern
title: "Filter-Responsive Derived Stats"
created: 2026-04-20
updated: 2026-04-20
status: seed
complexity: intermediate
domain: dashboard
projects_used:
  - "[[Deal Tracker Dashboard]]"
tags:
  - pattern
  - state-management
  - dashboard
---

## Problem

Dashboard has summary stats (KPIs, charts) and a filterable table. When the user filters or searches, the stats still show the full dataset. The KPIs lie about what the user is looking at.

## Solution

Derive all summary views from a single `filtered` array. KPIs, table rows, and chart data all consume this one source of truth. When any filter changes, everything updates in one render cycle.

```
raw data → filter/search → filtered array → [KPIs, table, chart]
```

In React, this means:
1. `filtered` = useMemo depending on filter + search state
2. `sorted` = useMemo depending on filtered + sort state
3. `stats` = useMemo depending on filtered
4. `chartData` = useMemo depending on filtered

## Why It Matters

Users expect visual consistency. If the table shows 7 Under Review deals, the KPI card should show 7 — not 20. If the search narrows to "Restaurant," the chart should reflect restaurant deals only. Breaking this contract makes the dashboard feel broken even if nothing is technically wrong.

## Implementation Notes

- The filtered array is the single source of truth. Never compute stats from raw data.
- Sort operates on filtered, not raw. This is the correct order: filter first, sort second.
- Empty state must propagate: if filtered is empty, KPIs show zero/dash, chart shows empty message, table shows empty state. All three, not just the table.

## First Used

[[Deal Tracker Dashboard]] — April 2026

## Connections

- Prevents: [[Aggregate KPIs Require Interaction]]
- Related: [[Status-Segmented KPI Cards]]
