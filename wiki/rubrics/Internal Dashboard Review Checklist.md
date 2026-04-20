---
type: rubric
title: "Internal Dashboard Review Checklist"
created: 2026-04-20
updated: 2026-04-20
status: developing
dimensions:
  - workflow_answer
  - mechanics
  - layout
projects_applied:
  - "[[Deal Tracker Dashboard]]"
tags:
  - rubric
  - dashboard
---

## When to Use

Apply to any internal dashboard or data-table project before calling it shipped.

## Dimensions

### 1. Does it answer the workflow question?

The user has a job to do. The dashboard should answer their primary question on first paint.

- Can the user answer their core question without clicking anything?
- Do the KPIs show the right breakdown for the domain (e.g., dollar-weighted pipeline by status in lending)?
- Does filtering update everything — KPIs, table, and chart — not just the table?
- Is there a "so what" layer (drawer, tooltip, detail view) that tells the user what to do next?

### 2. Are the core mechanics correct?

Every interactive element must work correctly. Silent failures are worse than crashes.

- Status filter actually filters (verify with each status option)
- Search works (case-insensitive, trimmed whitespace, matches relevant fields)
- Amount sorts numerically (not as strings — "$9,000" > "$10,000" is wrong)
- Risk sorts numerically
- Date sorts as dates, not strings (see [[Date Sorting as String Comparison]])
- Chart sums values correctly (cross-check against manual addition)
- Empty state propagates to all views (table, chart, KPIs)

### 3. Is the layout legible?

The hierarchy should match the user's workflow: summary → controls → working surface → supporting views.

- Summary stats above controls, controls above table
- Chart supports the table, doesn't compete with it (see [[Chart Below Table Not Above]])
- Currency formatting uses `tabular-nums` for column alignment
- Conditional formatting colors don't collide across columns (see [[Status-Risk Color Collision]])
- Readable date formatting (not raw ISO strings)
- Empty states have a message, not blank space

## Scoring

Pass/fail on each dimension. If any dimension fails, the project is not shippable. Note specific failures for the antipattern log.

## Revision History

- 2026-04-20: Initial version from [[Deal Tracker Dashboard]] review. Three dimensions.
