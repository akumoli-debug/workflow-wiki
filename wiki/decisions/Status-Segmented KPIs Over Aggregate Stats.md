---
type: decision
title: "Status-Segmented KPIs Over Aggregate Stats"
created: 2026-04-20
updated: 2026-04-20
status: active
project: "[[Deal Tracker Dashboard]]"
alternatives_considered:
  - "Three aggregate cards: total pipeline, deal count, avg risk"
trade_offs:
  - "Gains: answer the workflow question on first paint"
  - "Costs: loses avg risk from top-level view (mitigated by secondary summary line)"
tags:
  - decision
  - dashboard
---

## Context

Dashboard needs 3 KPI cards above the table. The obvious approach is aggregate stats: total pipeline ($1.4M), deal count (20), average risk score (42). Every dashboard tutorial does this.

## Decision

Show pipeline value segmented by status: Funded / Under Review / Declined as three separate cards, each with dollar value and deal count.

## Alternatives Considered

**Aggregate stats (total, count, avg risk):** Simpler. Tells you the size of the pipeline. But doesn't answer "how much is stuck in Under Review?" without interaction. The sales lead has to click the filter dropdown and watch the number change. That's one step too many for the primary question.

## Rationale

In lending, the dollars are the signal. $150K in Under Review matters more than "7 deals in Under Review." And the distribution across statuses is the actionable insight — not the total, which is static until new deals come in.

This is the Playbook's Step 4 in action: the obvious approach is aggregate stats, the non-obvious one that's actually better segments by status.

## Trade-offs

Loses the average risk score from the top-level view. Mitigated by adding a secondary summary line below the cards that shows total visible, deal count, and avg risk in a compact inline format. The aggregate data isn't gone — it's just demoted from hero position.

## Outcome

Review confirmed this was the right call. v1 used aggregate cards and the first review question was "can the sales lead tell what's under review without clicking?" — answer was no. Switching to segmented cards fixed it.
