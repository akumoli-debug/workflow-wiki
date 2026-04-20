---
type: project
title: "Deal Tracker Dashboard"
created: 2026-04-20
updated: 2026-04-20
status: shipped
brief: "[[.raw/briefs/deal-tracker-challenge.pdf]]"
stack: [React, Lucide React]
time_constraint: "30 minutes (25 build + 5 walkthrough)"
patterns_used:
  - "[[Filter-Responsive Derived Stats]]"
  - "[[Risk-Score Conditional Formatting]]"
  - "[[Row-Click Detail Drawer]]"
  - "[[Status-Segmented KPI Cards]]"
components_created:
  - "[[KPI Status Card]]"
  - "[[Sortable Table Header]]"
decisions:
  - "[[Status-Segmented KPIs Over Aggregate Stats]]"
  - "[[Chart Below Table Not Above]]"
  - "[[Text-Only Status Pills]]"
antipatterns_found:
  - "[[Date Sorting as String Comparison]]"
  - "[[Status-Risk Color Collision]]"
  - "[[Aggregate KPIs Require Interaction]]"
review_score: 4/5
tags:
  - project
  - dashboard
  - lending
---

## Summary

Single-page React dashboard for a fintech sales team to view their merchant funding deal pipeline. Built under a 30-minute constraint as a technical interview challenge. 20 deals with merchant name, amount, status, industry, risk score, and date submitted.

## What Shipped

- 3 KPI cards segmented by status (Funded / Under Review / Declined) showing dollar value and deal count
- Secondary summary line with total visible pipeline, deal count, and avg risk
- Status filter dropdown + merchant/industry search
- Sortable data table (amount, risk, date) with correct numeric and date sorting
- Horizontal bar chart showing pipeline value by status
- Risk-score conditional formatting (green <30, yellow 30-60, red >60) with dot indicator
- Row-click detail drawer with Recommended Action logic
- Empty states for table and chart

## Key Decisions

The strongest design choice was **[[Status-Segmented KPIs Over Aggregate Stats]]**. Most candidates show "total pipeline, deal count, avg risk." That tells you what you already know. Segmenting by status answers the real question: "how much is stuck in Under Review?" — visible on first paint, no interaction required.

## Review Notes

Three-pass review against [[Internal Dashboard Review Checklist]]:

1. **Workflow answer**: v1 required interaction to see Under Review value. Fixed by segmenting KPI cards by status.
2. **Mechanics**: All correct. Date sorting explicitly converts to timestamps — flagged as a deliberate choice worth narrating in walkthrough.
3. **Layout**: v1 had chart between cards and controls, pushing the table down. Fixed by moving chart below table. Status pills and risk pills used the same green — fixed with text-only status treatment.

## Retrospective

- **Went well**: Correct mechanics on first pass (filter, sort, chart sums). The review framework caught real issues.
- **Harder than expected**: Color differentiation between status and risk. The "two green things next to each other" problem isn't obvious until you scan real rows.
- **Do differently**: Start with status-segmented KPIs from the beginning. The "obvious" aggregate approach cost a revision cycle.
