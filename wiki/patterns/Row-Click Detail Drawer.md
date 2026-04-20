---
type: pattern
title: "Row-Click Detail Drawer"
created: 2026-04-20
updated: 2026-04-20
status: seed
complexity: intermediate
domain: dashboard
projects_used:
  - "[[Deal Tracker Dashboard]]"
tags:
  - pattern
  - interaction
  - dashboard
---

## Problem

Tables compress information to fit columns. Users need a way to see full detail on a single record without leaving the page or losing their place in the list.

## Solution

Click any table row to open a right-side drawer (fixed position, 420px wide, max 92vw) that shows all fields for that record plus derived information (like a Recommended Action) that doesn't fit in table columns.

Key mechanics:
- Click row → set selectedDeal state → drawer renders
- Click backdrop, × button, or press Escape → clear state → drawer closes
- Slide-in animation (200ms) for responsiveness, backdrop fade (150ms)

## Why It Matters

The drawer is the "so what" layer. The table answers "what do we have?" The drawer answers "what do I do about this specific deal?" In the Deal Tracker, this is where the Recommended Action lives — the one-line triage instruction a sales lead actually needs.

## Implementation Notes

- Put the highest-value derived information at the top of the drawer, not the bottom. In Deal Tracker, Recommended Action sits above the field list in a tinted callout.
- The drawer should mirror the table's field order so the user's mental model transfers.
- Escape key handler: add on mount, remove on unmount. Use useEffect with selectedDeal as dependency.
- Accessibility: the × button needs `aria-label="Close"`.

### Recommended Action Logic (Deal Tracker)

```
Funded → Monitor
Declined → Archive
Under Review + risk > 60 → Request additional documents
Under Review + risk 30–60 → Prioritize review
Under Review + risk < 30 → Strong candidate
```

Status takes precedence. Risk only matters for Under Review deals.

## First Used

[[Deal Tracker Dashboard]] — April 2026
