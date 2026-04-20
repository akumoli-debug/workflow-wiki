# workflow-wiki — AI Innovation Workflow Wiki

Mode: Workflow (adapted from Mode C: Business)
Purpose: Compound knowledge across AI innovation projects so each build is faster than the last.
Owner: [Your Team Name]
Created: 2026-04-20

## Structure

```
.raw/           source documents — immutable, Claude reads but never modifies
wiki/           Claude-generated knowledge base
_templates/     Obsidian Templater templates for each note type
```

## Page Types

| Type | Folder | What it captures |
|------|--------|-----------------|
| project | wiki/projects/ | One page per shipped build |
| pattern | wiki/patterns/ | Reusable solutions that transfer across projects |
| component | wiki/components/ | Documented code blocks with props and behavior |
| decision | wiki/decisions/ | What was chosen, what wasn't, and why |
| rubric | wiki/rubrics/ | Evaluation and review frameworks |
| antipattern | wiki/antipatterns/ | What failed and why — prevention notes |
| stack | wiki/stack/ | Tools, libraries, APIs — version and usage notes |

## Conventions

- All notes use YAML frontmatter: type, status, created, updated, tags (minimum)
- Wikilinks use [[Note Name]] format — filenames are unique, no paths needed
- .raw/ contains source documents — never modify them
- wiki/index.md is the master catalog — update on every ingest
- wiki/log.md is append-only — new entries go at the TOP, never edit past entries
- Atomic notes: one pattern per page, one decision per page. If it covers two things, split it.

## Operations

- **Ingest**: drop project artifacts in .raw/, say "ingest [project name]"
- **Query**: ask any question — Claude reads index first, then drills into relevant pages
- **Lint**: say "lint the wiki" every 5-10 projects to catch orphans and gaps
- **Review**: after any project review, ingest the review notes to capture new antipatterns and rubric updates

## Ingestion Protocol

When ingesting a completed project:

1. Read all project artifacts (brief, code, review notes)
2. Create project page in wiki/projects/
3. Extract 3-8 patterns → wiki/patterns/ (create new or update existing)
4. Extract reusable components → wiki/components/
5. Extract 1-3 key decisions → wiki/decisions/
6. Extract any failures → wiki/antipatterns/
7. Update or create applicable rubrics → wiki/rubrics/
8. Update wiki/index.md, wiki/log.md, wiki/hot.md
9. Cross-reference: every pattern page links to projects that use it, every project page links to patterns it used

## Cross-Project Access

To reference this wiki from a new project's CLAUDE.md:

```
## Workflow Knowledge Base
Path: ~/path/to/workflow-wiki

Before starting a new build:
1. Read wiki/hot.md (recent context)
2. Read wiki/patterns/_index.md (proven patterns)
3. Read wiki/antipatterns/_index.md (known traps)
4. Read wiki/rubrics/_index.md (review checklists)

Do NOT read the wiki for generic coding questions.
```
