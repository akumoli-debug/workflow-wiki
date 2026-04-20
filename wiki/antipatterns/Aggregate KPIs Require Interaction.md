---
type: antipattern
title: "Aggregate KPIs Require Interaction"
created: 2026-04-20
updated: 2026-04-20
status: seed
severity: medium
caught_in: "[[Deal Tracker Dashboard]]"
prevention: "Ask: can the user answer their primary question on first paint? If the answer requires clicking a filter, the KPIs are decorative, not informative."
tags:
  - antipattern
  - dashboard
  - ux
---

## What Happened

v1 showed three aggregate KPI cards: total pipeline ($1.4M), deal count (20), average risk score (42). The sales lead's actual question — "how much is in Under Review?" — could only be answered by opening the status filter dropdown and selecting Under Review. The KPIs were correct but uninformative.

## Root Cause

Aggregate stats are the default because they're easy to compute and always look impressive ($1.4M pipeline!). But in lending, the distribution matters more than the total. The total only changes when new deals come in. The distribution changes with every status update.

## Fix

Replaced aggregate cards with status-segmented cards: Funded / Under Review / Declined, each showing dollar value and deal count. Aggregate stats moved to a secondary summary line. See [[Status-Segmented KPIs Over Aggregate Stats]].

## Prevention

Before finalizing KPI cards, write down the user's top question. Then check: is the answer visible on the default view without any interaction? If not, the cards are answering the wrong question.

## Connections

- Decision: [[Status-Segmented KPIs Over Aggregate Stats]]
- Pattern: [[Status-Segmented KPI Cards]]
