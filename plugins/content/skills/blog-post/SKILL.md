---
name: blog-post
description: Draft a 600-1200 word blog post tied to a customer insight, experiment result, or build story. Optimized for the hackathon: real, specific, no fluff. Always returns the post with a one-paragraph TL;DR for skim-readers. Use for: "write a blog post about X", "long-form on our customer learning", "write up what we shipped". Do NOT use for short social posts (use linkedin-post) or SEO content farms.
---

# blog-post

Hackathon fork of `drafting-blog-posts`. Writes to `blog/<YYYY-MM-DD>-<slug>.md`.

## Preconditions

Refuse to draft unless:
1. **Specific moment.** Not "thoughts on AI" — must be "we tested X with Y customers and found Z."
2. **Audience clear.** Who is supposed to read this and what should they do after?
3. **One thesis.** If the team has 3 points to make, that's 3 posts.

## Structure

```markdown
# <Title — specific number or surprise>

**TL;DR:** <one paragraph for the skim reader>

## The setup
What we were trying to do. 1-2 paragraphs.

## What we actually tried
The thing. Specifics — code, costs, screenshots, dates. 2-3 paragraphs.

## What happened
Real numbers. Real quotes. What worked, what didn't. 2-4 paragraphs.

## What we'd do differently
Honest retrospection. Anti-pattern: a humble-brag list. Real anti-pattern: "this was harder than we thought." 1-2 paragraphs.

## What you can steal
Concrete takeaway the reader can apply Monday. 1 paragraph.

---
*<author>, <date>. We're building <thing> for <segment>. <CTA link>.*
```

## Output

Save to `blog/<YYYY-MM-DD>-<slug>.md`. Don't auto-publish.

## Rules

- Specificity over polish. "We charged $19, 7 of 200 visitors bought" beats "we got strong early signal."
- Lead with the surprise. Skim readers leave at paragraph 1.
- Include one number in the title if possible — it raises CTR.
- One thesis. Side-thoughts go in another post.
- No "in today's fast-paced world." Cut.
