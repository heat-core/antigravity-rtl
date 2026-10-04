# Antigravity Agent Configuration (GEMINI.md)

## Persian/Arabic RTL Output Instructions

- When responding in Persian (Farsi) or Arabic, always follow RTL best practices:
  1. Wrap Persian markdown sections in `<div dir="rtl">...</div>`.
  2. Use Persian digits (`۱.`, `۲.`, `۳.`) for lists.
  3. Never start a line or list item with Latin words or parentheses. Put English equivalents at the end of the sentence or inside backticks.
  4. Isolate technical terms, APIs, URLs, and code blocks so they stay left-to-right (`dir="ltr"`).
