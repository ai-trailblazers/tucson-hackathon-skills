---
name: customer-finder
description: Build a ranked list of 20-50 prospective customers the team can talk to within 48 hours. Combines Tucson-local venues + online communities + LinkedIn search filters tied to the team's ICP. Use early on Day 1 right after positioning is locked. Triggers: "find me 20 customers", "where do our customers hang out", "build a prospect list", "who can we talk to today". Pairs upstream with positioning-statement and downstream with cold-outreach-sequence + discovery-interview-prep.
---

# customer-finder

Hackathon-original, riffs on `researching-customer-segments`. Writes to `prospects.csv` + `prospects.md` in the team's repo.

## Preconditions

Refuse to start unless:
1. **Positioning is set.** Team can name "for [target market] who [problem]". If not → `positioning-statement`.
2. **48-hour reachability constraint.** Each prospect must be reachable via DM, email, in-person at IDA, or local intro within 48h.

## Channels to pull from (ranked by hackathon speed)

1. **In-person at IDA (the hackathon venue)** — fastest. Ask: who's here that fits the ICP?
2. **Personal LinkedIn network of each team member** — 2nd-degree connections in ICP.
3. **Tucson-local groups:** Old Pueblo New Economy Meetup, Startup Tucson, TechCatalyst, SAACA Catalyst, Pima Community College, U of A Eller MIS, local Slacks.
4. **Online niche communities:** subreddits, Discord servers, Indie Hackers, specific Twitter/X lists.
5. **LinkedIn search** with these filters: industry + size + role + Tucson (or extended geography if relevant).
6. **Google Maps for B2B local:** specific industry + zip code (e.g., "Tucson roofing contractor 85705").

## Output

`prospects.csv`:
```csv
rank,name,role,company,channel,how_to_reach,why_them,status
1,...
```

`prospects.md`:
```markdown
# Prospect list — <segment slug>
**Total:** 25 (target: 20-50)
**Reachable in 48h:** 25/25

## Top 10 (talk to first)
| # | Name | Why this person | How to reach | Status |
|---|------|-----------------|--------------|--------|
| 1 | ... | ... | LinkedIn DM | not yet |

## Channels searched
- [x] IDA venue scan (Day 1, 10am)
- [x] LinkedIn 2nd-degree
- [x] OPNE Meetup roster
- [ ] Reddit r/<niche>

## Disqualifications
List 5-10 people you considered and rejected, with reason. Helps the team stay tight on ICP.
```

## Rules

- Specific people, not "small business owners." Named human or specific company.
- "How to reach" must be concrete: "DM on LinkedIn", "introduce via [common connection]", "at IDA Saturday".
- If you can't reach them in 48h, they're not a prospect for the hackathon. Move to a "post-hackathon" list.
- 20-50 prospects is the band. Less = team runs out of conversations. More = they won't actually reach out.
