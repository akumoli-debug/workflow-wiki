---
type: pattern
title: "Risk-Score Conditional Formatting"
created: 2026-04-20
updated: 2026-04-20
status: seed
complexity: basic
domain: dashboard
projects_used:
  - "[[Deal Tracker Dashboard]]"
tags:
  - pattern
  - data-visualization
  - dashboard
---

## Problem

Numeric scores in a table are hard to scan. A column of numbers (22, 55, 78, 15, 61) requires reading each value to assess severity. The eye can't triage at a glance.

## Solution

Encode risk bands with background color and a small dot indicator:

| Band | Range | Background | Text | Dot |
|------|-------|-----------|------|-----|
| Low | < 30 | #E6F4EA | #137333 | #1E8E3E |
| Medium | 30–60 | #FEF7E0 | #A56300 | #E8A317 |
| High | > 60 | #FCE8E6 | #B3261E | #D93025 |

The dot adds a secondary visual channel beyond color alone, improving accessibility for color-vision-deficient users.

## Why It Matters

In lending, risk score drives the action. A sales lead scanning 20 rows should instantly see which deals need attention. Color-coding makes this a peripheral vision task instead of a reading task.

## Implementation Notes

- Use a helper function that returns `{ bg, fg, dot }` for a given score.
- Render as a pill: inline-flex with gap, background, border-radius, tabular-nums.
- Keep the number visible — color augments the number, doesn't replace it.
- Important: risk colors must be visually distinct from status colors. See [[Status-Risk Color Collision]].

## First Used

[[Deal Tracker Dashboard]] — April 2026

## Connections

- Antipattern: [[Status-Risk Color Collision]]
- Related decision: [[Text-Only Status Pills]]
