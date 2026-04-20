---
type: decision
title: "Chart Below Table Not Above"
created: 2026-04-20
updated: 2026-04-20
status: active
project: "[[Deal Tracker Dashboard]]"
alternatives_considered:
  - "Chart between KPI cards and controls"
  - "Chart in a collapsible sidebar"
trade_offs:
  - "Gains: table dominates the viewport as the primary working surface"
  - "Costs: chart requires scrolling to see on smaller screens"
tags:
  - decision
  - layout
---

## Context

Dashboard has KPI cards, controls (filter + search), a data table, and a bar chart. Need to decide the vertical stacking order.

## Decision

Stack: KPI cards → secondary summary → controls → table → chart. Table is the working surface. Chart is supporting context.

## Rationale

v1 placed the chart between the cards and controls. This pushed the table further down the page. The chart took ~180px of vertical space, and on a 1080p monitor the table started below the fold. Since the table is where a sales lead spends most of their time (scanning, sorting, clicking into deals), it should dominate the viewport.

The chart shows pipeline value by status — useful context, but the KPI cards already show this in numeric form. The chart is a visual reinforcement, not a primary tool. It belongs below the table where it's available but doesn't compete.

## Trade-offs

On smaller screens the chart requires scrolling. Acceptable: if you can only see one thing, see the table.
