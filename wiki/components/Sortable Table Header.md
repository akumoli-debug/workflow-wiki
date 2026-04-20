---
type: component
title: "Sortable Table Header"
created: 2026-04-20
updated: 2026-04-20
status: seed
framework: React
props: [label, sortKey, currentSortKey, sortDir, onSort]
projects_used:
  - "[[Deal Tracker Dashboard]]"
tags:
  - component
  - data-table
---

## Purpose

Table column header that acts as a sort toggle. Shows current sort direction with an icon. Clicking toggles direction if already active, or activates with descending as default.

## Props

| Prop | Type | Required | Description |
|------|------|----------|-------------|
| label | string | yes | Column header text |
| sortKey | string | yes | The data field this column sorts by |
| currentSortKey | string | yes | Currently active sort field |
| sortDir | "asc" \| "desc" | yes | Current sort direction |
| onSort | function | yes | Callback: `(key) => void` |

## Behavior

- If this column is not the active sort: show neutral ArrowUpDown icon (35% opacity)
- If active + ascending: show ArrowUp icon
- If active + descending: show ArrowDown icon
- Click when inactive: activate with descending default
- Click when active: toggle direction

## Styling Notes

- Rendered as a `<button>` with no background/border for accessibility
- 11px uppercase, letter-spacing 0.04em, #6B7280
- Hover: text color shifts to #1A1D21
- Icon: 13px Lucide icons, inline-flex with 6px gap

## Known Limitations

- Not extracted as standalone — inline button + SortIcon component in Deal Tracker
- Only supports numeric and date sorts. String sort (localeCompare) not implemented yet.
