---
type: meta
title: "Wiki Index"
updated: 2026-04-20
---

# Wiki Index

## Projects
- [[Deal Tracker Dashboard]] — React internal dashboard for sales pipeline. 30-min build. (shipped)

## Patterns
- [[Filter-Responsive Derived Stats]] — all summary views derive from one filtered array (seed)
- [[Risk-Score Conditional Formatting]] — green/yellow/red encoding with dot indicator (seed)
- [[Row-Click Detail Drawer]] — click table row to open right-side detail panel (seed)
- [[Status-Segmented KPI Cards]] — pipeline value broken out by status, not aggregated (seed)

## Components
- [[KPI Status Card]] — left-border accent card showing value + count for one status (seed)
- [[Sortable Table Header]] — column header button with sort direction indicator (seed)

## Decisions
- [[Status-Segmented KPIs Over Aggregate Stats]] — dollar-weighted breakdown over generic totals (active)
- [[Chart Below Table Not Above]] — table is the working surface, chart is supporting (active)
- [[Text-Only Status Pills]] — avoid background fill to prevent color collision with risk pills (active)

## Rubrics
- [[Internal Dashboard Review Checklist]] — 3 dimensions: workflow answer, mechanics, layout (developing)

## Antipatterns
- [[Date Sorting as String Comparison]] — ISO strings produce NaN with numeric subtraction (high)
- [[Status-Risk Color Collision]] — green Funded pill next to green risk pill, eye can't separate (medium)
- [[Aggregate KPIs Require Interaction]] — default stats don't answer the actual question (medium)

## Stack
- [[React]] — UI framework
- [[Lucide React]] — icon library
