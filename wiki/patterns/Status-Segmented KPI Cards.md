---
type: pattern
title: "Status-Segmented KPI Cards"
created: 2026-04-20
updated: 2026-04-20
status: seed
complexity: basic
domain: dashboard
projects_used:
  - "[[Deal Tracker Dashboard]]"
tags:
  - pattern
  - dashboard
  - lending
---

## Problem

Default KPI cards show aggregate stats: total pipeline, deal count, avg risk score. These tell the user what they already know. The real question — "how much is in each stage?" — requires clicking a filter dropdown.

## Solution

Replace aggregate KPIs with one card per status bucket. Each card shows:
- Status name (label)
- Dollar value for that status (hero number)
- Deal count (supporting detail)
- Left border in the status's semantic color

Aggregate stats (total visible, count, avg risk) move to a slim secondary summary line below the cards.

## Why It Matters

In lending, dollars drive decisions — not deal counts. A sales lead glancing at the dashboard should immediately see "$585K in Under Review across 7 deals" without touching anything. This is the "informative on first paint" principle: the most important answer is visible before any interaction.

## Implementation Notes

- Derive each bucket from the same filtered array used by the table (see [[Filter-Responsive Derived Stats]]).
- When filters are active, the cards update to reflect filtered data only.
- Use a left-border accent (3px solid) rather than a full background tint. Keeps the cards scannable without overwhelming.

## First Used

[[Deal Tracker Dashboard]] — April 2026

## Connections

- Decision: [[Status-Segmented KPIs Over Aggregate Stats]]
- Antipattern prevented: [[Aggregate KPIs Require Interaction]]
- Component: [[KPI Status Card]]
