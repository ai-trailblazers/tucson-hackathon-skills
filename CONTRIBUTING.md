# Contributing

Want to add a skill? Three paths.

## 1. Vendor an existing skill from elsewhere

Use this when an upstream skill is good, but you want a frozen, vetted copy in the hackathon directory.

```
skills/<role>/<skill-name>/
├── SKILL.md           # the skill itself (verbatim from upstream)
├── SOURCE.md          # required — see template below
└── <any support files referenced by SKILL.md>
```

`SOURCE.md` template:

```markdown
# Source

- **Upstream:** https://github.com/<org>/<repo>/tree/<commit>/path/to/skill
- **Commit pinned:** <sha>
- **License:** MIT / Apache-2.0 / etc.
- **Vendored on:** YYYY-MM-DD by <your name>

## Vetting notes

- Tested with: <prompt you used>
- Worked for: <what it produced>
- Caveats: <anything a hackathon team should know>
- Hackathon value: ties to <experiments | customer-convos | payment | AI-teammate-collab>
```

## 2. Author an original skill

Use this when no upstream version exists, or you want it tailored to hackathon mechanics (e.g. milestone broadcast, sponsor credit redemption).

```
skills/<role>/<skill-name>/
├── SKILL.md           # YAML frontmatter (name, description) + body
└── README.md          # optional context — why this exists, who it's for
```

Originals are MIT-licensed by inclusion in this repo.

## 3. Link without vendoring

For skills that update frequently upstream and you'd rather defer. Add a row to the relevant role's table in `README.md` with name, link, one-line verdict. No folder needed.

---

## Skill quality bar

Before merging:

- [ ] SKILL.md frontmatter `description` is specific enough to trigger correctly (mentions concrete user requests, not just topics)
- [ ] No secrets, API keys, or personal data in files
- [ ] Tested in a fresh Claude Code session — skill activates on a plausible prompt
- [ ] Files referenced in SKILL.md actually exist
- [ ] License compatible with MIT distribution
- [ ] Fits at least one role bucket; if it spans many, pick the primary

## PR title format

```
[<role>] add <skill-name> — <one-line value>
```

Example: `[sales] add cold-email-warmup — drafts 5-touch outreach sequence from one prospect URL`
