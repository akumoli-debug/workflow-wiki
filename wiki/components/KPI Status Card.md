---
type: component
title: "KPI Status Card"
created: 2026-04-20
updated: 2026-04-20
status: seed
framework: React
props: [status, value, count, accentColor]
projects_used:
  - "[[Deal Tracker Dashboard]]"
tags:
  - component
  - dashboard
---

## Purpose

Displays a single status bucket's dollar value and deal count. Used in a row of 3 to show pipeline segmented by status.

## Props

| Prop | Type | Required | Description |
|------|------|----------|-------------|
| status | string | yes | Status label ("Funded", "Under Review", "Declined") |
| value | number | yes | Dollar value for this status bucket |
| count | number | yes | Number of deals in this status |
| accentColor | string | yes | Left border color (semantic: green for Funded, blue for Under Review, gray for Declined) |

## Styling Notes

- White background, 1px border (#E8EAED), border-radius 10px
- 3px solid left border in accent color
- Label: 11px uppercase, #6B7280
- Value: 26px, weight 600, tabular-nums
- Count: 12px, #6B7280, shows "N deals" (pluralized)
- Padding: 20px 22px

## Usage

```jsx
<div style={{
  background: "white",
  border: "1px solid #E8EAED",
  borderRadius: 10,
  padding: "20px 22px",
  borderLeft: `3px solid ${accentColor}`,
}}>
  <div className="label">{status}</div>
  <div className="value">{fmtCurrency(value)}</div>
  <div className="count">{count} {count === 1 ? "deal" : "deals"}</div>
</div>
```

## Known Limitations

- Not extracted as a standalone component yet — inline in the Deal Tracker. Next project that reuses it should extract properly.
- Accent color is hardcoded per status. A more flexible version would accept any color.
