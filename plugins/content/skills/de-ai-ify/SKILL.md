---
name: de-ai-ify
description: Pass a draft (post, email, blog, ad copy) and rewrite it to remove AI-tells while preserving meaning. Strips em dashes, replaces filler verbs, cuts "in today's world" openings, breaks 3-clause sentences, removes "It's worth noting that". Use whenever any content skill produces a draft you're about to ship. Triggers: "de-AI-ify this", "clean up the draft", "this sounds like ChatGPT", "make it sound human". Pairs as downstream cleanup for every other content skill.
---

# de-ai-ify

Hackathon fork of `email-style-guide`. Runs against any draft, returns a cleaned version + a list of what changed.

## The AI-tell checklist

Pass through the draft and flag/fix each:

1. **Em dashes** (—). Replace with periods, commas, or new sentences. Always.
2. **"In today's fast-paced world / In an era of / In the modern landscape."** Cut entirely.
3. **Filler verbs:** "leverage" → "use". "utilize" → "use". "facilitate" → "help". "embark on" → "start". "tapestry" → kill the metaphor entirely.
4. **"It's worth noting that / It's important to note / Notably."** Cut. Just say the thing.
5. **Tricolons run amok:** "We help startups grow, scale, and thrive." Pick one verb. The other two are filler.
6. **"Delve / glean / treasure trove / robust ecosystem / cutting-edge."** All AI-flavored. Replace with concrete words.
7. **Hedging without need:** "could potentially help" → "helps". "may be able to" → "can".
8. **Robotic transitions:** "Furthermore, Moreover, Additionally" — replace with periods or new paragraphs.
9. **Closing summaries** that restate what you just said. Cut.
10. **Bullet lists with parallel adjectives** ("Easy. Fast. Reliable.") — pick the one that's actually true.

## Output

```markdown
# De-AI'd draft

<rewritten version>

---

## What I changed
- Removed N em dashes
- Replaced "leverage" (3x) with "use"
- Cut opening filler: "In today's fast-paced AI landscape..."
- Broke 4 tricolons
- Shortened from N words → M words

## What I left alone
- <anything intentional that triggered a heuristic but is fine in context>
```

## Anti-patterns the team should NOT fix

- Specific numbers, dates, quotes — keep.
- Brand names, product names — keep.
- One-clause sentences ending in periods — humans write that too.
- Contractions ("we're", "don't") — these are FINE. AI tends to avoid them; humans use them.

## Rule of thumb

If a sentence could appear in 1,000 LinkedIn posts with the noun swapped, it's filler. Rewrite or cut.
