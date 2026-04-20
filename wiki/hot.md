---
type: meta
title: "Hot Cache"
updated: 2026-04-20
---

# Recent Context

## Last Updated
2026-04-20 — Ingested Deal Tracker Dashboard project (first project in vault)

## Key Recent Facts
- Dollar-weighted pipeline cards (Funded / Under Review / Declined) answer the sales lead's question on first paint without requiring interaction. This is the strongest design choice in the build.
- Date sorting as string comparison is a silent failure: no error, just wrong order. Convert ISO strings to timestamps before comparing.
- Status pills and risk pills should use different visual treatments (text-only vs. background fill) to avoid green-on-green collision in Funded + low-risk rows.

## Recent Changes
- Created: 4 patterns, 2 components, 3 decisions, 1 rubric, 3 antipatterns
- Established [[Internal Dashboard Review Checklist]] as the first reusable rubric

## Active Threads
- First project ingested. Need 3-4 more projects to validate which patterns are truly reusable.
- Review checklist has 3 dimensions — will likely grow as more project types are built.
