---
type: decision
title: "Text-Only Status Pills"
created: 2026-04-20
updated: 2026-04-20
status: active
project: "[[Deal Tracker Dashboard]]"
alternatives_considered:
  - "Background-filled status pills (like risk pills)"
trade_offs:
  - "Gains: eliminates green-on-green collision with risk pills"
  - "Costs: status column is less visually prominent"
tags:
  - decision
  - visual-design
---

## Context

The table has two columns that use color encoding: Status and Risk Score. v1 used background-filled pills for both. Funded status used a green background. Low-risk scores also used a green background. On a Funded row with risk 22, two green blobs sat next to each other and the eye couldn't separate them.

## Decision

Status uses text-only rendering (colored text, no background fill). Risk keeps background-filled pills with dot indicators. The two systems are now visually distinct.

Status colors: Funded = near-black (#1A1D21), Under Review = accent blue (#2D5BFF), Declined = muted gray (#9AA0A6).

## Rationale

Risk score is the more important color-encoded column — it drives the Recommended Action and is the primary triage signal. It deserves the stronger visual treatment (background fill + dot). Status is important but more categorical — the user reads the word, not the color. Text-only treatment is sufficient.

## Connections

- Antipattern: [[Status-Risk Color Collision]]
- Pattern: [[Risk-Score Conditional Formatting]]
