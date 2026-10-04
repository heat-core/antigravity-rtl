# Persian RTL & BiDi Best Practices for AI Agents

This rule ensures that Persian (Farsi) and Arabic texts rendered in Google Antigravity IDE and VS Code chat webviews do not suffer from punctuation flipping, broken parentheses, or LTR mixed-direction scrambling.

---

## 1. Primary Rules for Responses

Whenever answering in Persian (Farsi):

### A. Numbering and Lists
- **Always use Persian/Arabic digits** (`۱.`, `۲.`, `۳.`) instead of Latin digits (`1.`, `2.`, `3.`) when writing numbered lists.
  - ❌ Incorrect: `1. بررسی ایده اصلی` (Treated by browser as LTR start marker, flipping the line).
  - ✅ Correct: `۱. بررسی ایده اصلی`
- Keep bullet points (`*` or `-`) followed immediately by a space and Persian characters.

### B. Placement of English Words & Code Terms
- **Never start a sentence or bullet point with an English word, endpoint, or parenthesis.**
  - ❌ Incorrect: `• (Introspection) لایه شناسایی محیط`
  - ✅ Correct: `• **لایه شناسایی محیط** (Introspection):`
- When mentioning methods, HTTP endpoints, or file paths, either:
  1. Put them in an isolated code block or separate line:
     ```
     POST /prompt
     ```
  2. Or wrap them in backticks `` `endpoint` `` and keep them separated with spaces from Persian punctuation.

### C. Large Text Blocks & HTML RTL Container
- Wrap major Persian sections in `<div dir="rtl">...</div>` to guarantee explicit right-to-left layout in environments lacking automated `dir="auto"`.

### D. Code Blocks, Diagrams, and Math
- All code snippets (` ```python `, ` ```bash `), JSON objects, and Mermaid diagrams must remain in standard markdown blocks so they preserve natural LTR direction.

---

## Example Demonstration

### ❌ What Causes Scrambling:
```markdown
1. (API) یک سرویس است که با POST /prompt کار میکند.
```

### ✅ Clean & Proper Formatting:
```markdown
<div dir="rtl">

۱. **سرویس وب** (API):
این سرویس از طریق اندپوینت زیر پردازش را آغاز می‌کند:
`POST /prompt`

</div>
```
