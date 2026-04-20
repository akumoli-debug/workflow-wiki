---
type: antipattern
title: "Status-Risk Color Collision"
created: 2026-04-20
updated: 2026-04-20
status: seed
severity: medium
caught_in: "[[Deal Tracker Dashboard]]"
prevention: "When two columns use color encoding, use different visual treatments (e.g., one text-only, one background-filled) so they're distinguishable."
tags:
  - antipattern
  - visual-design
  - accessibility
---

## What Happened

v1 used green background-filled pills for both "Funded" status and low risk scores (<30). On a Funded row with risk 22, two green blobs sat adjacent in the table. The eye couldn't separate them at scanning speed.

## Root Cause

Both columns independently chose "green = good." Locally reasonable, globally broken. The problem only surfaces when you scan real rows with both columns visible.

## Fix

Changed status to text-only rendering (no background, just colored text). Risk keeps background-filled pills. The two systems are now visually distinct. See [[Text-Only Status Pills]].

## Prevention

When designing color-encoded columns, check them in combination on realistic data, not in isolation. If two columns can both show "green" on the same row, one needs a different treatment.

General rule: reserve background-filled pills for the more important of the two encoded columns. Use text-only for the less critical one.

## Connections

- Decision: [[Text-Only Status Pills]]
- Pattern: [[Risk-Score Conditional Formatting]]
