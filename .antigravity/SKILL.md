---
name: Article_flow
description: Use this skill to remember the 5 Agents and 5-step Flow for the article content pipeline. This ensures you do not forget the structure and do not need to be corrected.
---

# Article Content Pipeline Flow

This skill serves as a memory anchor and operational guide for the Article Content Pipeline.

## 🤖 The 5 Agents
These agents are located in the `/home/nikhil/.gemini/antigravity/agents/` directory:

1. **`article-researcher.md`**: Responsible for Phase 0. Searches the web for virality patterns, trends, and data points. Outputs a `Research-Brief-[Topic].md`.
2. **`business-article-writer.md`**: Responsible for drafting content for LinkedIn, Facebook, Threads, and Instagram based on the Research Brief. Must read this SKILL file before drafting to avoid past mistakes. Enforces constraints.
3. **`article-organizer.md`**: Responsible for scanning the root directory and organizing loose article files into dated topic folders (`art-DD-MM-YYYY/Topic-Name/`).
3. **`article-enricher.md`**: Responsible for reading articles in the dated folder, generating platform-specific AI image prompts, and creating actual images.
4. **`article-reviewer.md`**: Responsible for scoring the articles in the dated folder against quality criteria. Dynamically logs failures to this SKILL file.

## 📋 The 6-Step Flow
When requested to write articles using this pipeline, follow these steps in order:

1. **Research**: Trigger the `article-researcher`. It searches the web and outputs a Research Brief.
2. **Write**: Trigger the `business-article-writer`. It reads the brief, drafts articles, and applies constraints.
3. **Organize**: Trigger the `article-organizer`. It moves the files and brief into a topic-specific folder.
4. **Enrich & Generate Images**: Trigger the `article-enricher`. It creates image prompts and actual assets.
5. **Review**: Trigger the `article-reviewer`. It scores the articles. If a failure occurs, it will log it below in the "Learning from Mistakes & Corrections" section.
6. **Verify**: Before declaring the flow finished, perform a final internal check.

## ⚠️ Important Rules for the Assistant
- **DO NOT** search for these agents in the skills directory. They live in `/home/nikhil/.gemini/antigravity/agents/`.
- **DO NOT** ask the user for the structure or flow. Refer to this skill file.
- Follow the **Auto-Fix Flow** in `article-reviewer.md` if scores are low. Max 1 retry before hard fail.

## 🧠 Learning from Mistakes & Corrections
*(The article-reviewer agent will dynamically append to this section if articles fail. The business-article-writer agent must read this section before drafting.)*
- **Mistake Correction (2026-05-18)**: "Generate Images" means creating the actual image files using the tool, not just the text prompts. Always complete the visual asset creation.
- **Mistake Correction (2026-05-18)**: Using identical slugs for different platforms (e.g., `Li-Topic` and `Fb-Topic`). Always ensure unique filenames and titles per platform.
- **Mistake Correction (2026-05-18)**: Generating only 1 image for the entire batch. Correction: Strictly generate 1 distinct image per platform.
- **Mistake Correction (2026-05-18)**: Accepting vague references like "recent research" as valid citations. Correction: Every article must contain a verifiable citation. Include a clean "REFERENCES:" section at the bottom.
- **Mistake Correction (2026-05-21)**: Missing hashtags and Instagram captions. EVERY article must end with 3-8 relevant hashtags. The Instagram article must explicitly include a text `Caption:` below the carousel slides.
- **Mistake Correction (2026-05-25)**: Missing Alt Text in Instagram carousels. The Instagram article must explicitly include a structured `**Alt Text:**` description line for EVERY slide image to ensure accessibility.
