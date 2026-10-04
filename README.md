# Antigravity RTL 🚀

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![IDE: Google Antigravity](https://img.shields.io/badge/Google-Antigravity%20IDE-purple.svg)](https://antigravity.google)
[![Language: Persian / Arabic / RTL](https://img.shields.io/badge/Support-Persian%20%7C%20Arabic%20%7C%20RTL-brightgreen.svg)](#)

> **Complete Right-to-Left (RTL) & BiDi rendering fix for Google Antigravity IDE.**  
> حل کامل مشکل راست‌چین نبودن متن‌های فارسی، برعکس شدن پرانتزها و تداخل کلمات انگلیسی در محیط چت و اسکرچ‌پد Antigravity IDE.

---

[English Documentation](#english) | [راهنمای فارسی](#فارسی)

---

<a name="فارسی"></a>
## 🇮🇷 راهنمای فارسی

### مشکل چیست؟
محیط چت و پنل Scratchpad در **Antigravity IDE** متن‌ها را به صورت پیش‌فرض در جهت چپ‌به‌راست (LTR) نمایش می‌دهد. زمانی که پاسخی به زبان فارسی شامل اعداد انگلیسی (`1.`)، پرانتزها یا اصطلاحات فنی لاتین (مثل `API`، `ComfyUI` یا `POST /prompt`) باشد:
- پرانتزها و علائم نگارشی پشت‌ورو می‌شوند.
- کلمات انگلیسی نظم خطوط را به هم می‌زنند.
- لیست‌ها و بالت‌پوینت‌ها در جای نادرست نمایش داده می‌شوند.

این پکیج یک راهکار دو لایه و استاندارد برای حل همیشگی این مشکل ارائه می‌کند.

---

### ویژگی‌های کلیدی
- ✨ **راست‌چین‌سازی هوشمند (Smart RTL):** تشخیص خودکار جهت پاراگراف‌ها با حفظ چپ‌چین بودن کامل کدها و دیاگرام‌ها (`pre`, `code`, `mermaid`).
- 🔤 **فونت استاندارد وزیرمتن (Vazirmatn):** لود خودکار فونت خوانای وزیرمتن برای زیبایی حداکثری متون فارسی.
- 🤖 **قانون ایجنت هوش مصنوعی (AI Agent Rule):** جلوگیری از تولید قالب‌های ناسازگار با الگوریتم BiDi در پاسخ‌های جمینای / آنتی‌گرویتی.
- ⚡ **اسکریپت نصب تک‌کلیک:** نصب در هر ورک‌اسپیس یا اجرای آنی در کنسول DevTools.

---

### روش‌های استفاده

#### ۱. روش سریع (بدون نیاز به نصب - از طریق DevTools)
1. در نرم‌افزار **Antigravity IDE** کلیدهای **`Ctrl + Shift + I`** را بزنید (یا از منوی بالا: `Help` > `Toggle Developer Tools`).
2. به تب **Console** بروید.
3. کد موجود در فایل [`scripts/devtools-snippet.js`](scripts/devtools-snippet.js) را کپی کرده، در کنسول پیست کنید و اینتر بزنید.
4. ظاهر چت بلافاصله راست‌چین و منظم می‌شود! (با اجرای مجدد کد، وضعیت به حالت اولیه برمی‌گردد).

#### ۲. فعال‌سازی قوانین هوش مصنوعی برای پروژه شما
اگر می‌خواهید هوش مصنوعی در پروژه‌ی فعلی همیشه پاسخ‌های فارسی را راست‌چین و بدون تداخل خروجی دهد، در پاورشل دستور زیر را اجرا کنید:
```powershell
.\scripts\install.ps1 -TargetWorkspace "C:\path\to\your\project"
```
این اسکریپت فایل‌های قانون [`.agents/rules/persian-rtl.md`](agent-rules/persian-rtl.md) و [`GEMINI.md`](agent-rules/GEMINI.md) را به پروژه شما اضافه می‌کند.

---

<a name="english"></a>
## 🇬🇧 English Guide

### The Problem
Google Antigravity IDE uses Chromium/Electron webviews for its Chat and Scratchpad panels. By default, chat messages inherit `direction: ltr`. When Persian/Arabic text contains Latin terms, punctuation, or numbers, the browser's Bidirectional (BiDi) algorithm flips parentheses, misplaces periods/colons, and severely scrambles mixed-language sentences.

### Solution Overview
1. **`css/antigravity-rtl.css`**: Smart CSS stylesheet injecting `direction: rtl`, `unicode-bidi: plaintext`, and the clean `Vazirmatn` Persian font, while strictly keeping code blocks (`<pre>`, `<code>`, `.terminal`, `.mermaid`) in `direction: ltr`.
2. **`agent-rules/persian-rtl.md`**: Custom agent instructions that enforce Persian numbers (`۱, ۲, ۳`), prevent sentences starting with Latin terms, and isolate technical endpoints.
3. **`scripts/devtools-snippet.js`**: 1-click toggle snippet for DevTools Console.
4. **`scripts/install.ps1`**: Automated installer for Antigravity workspaces.

---

## 📂 Repository Structure

```text
antigravity-rtl/
├── css/
│   └── antigravity-rtl.css        # Core stylesheet for webview RTL styling
├── scripts/
│   ├── devtools-snippet.js        # One-line toggle script for DevTools console
│   ├── install.ps1                # Automated Windows installer
│   └── uninstall.ps1              # Uninstallation script
├── agent-rules/
│   ├── persian-rtl.md             # Custom rule for Antigravity AI agents
│   └── GEMINI.md                  # Workspace-level configuration template
├── docs/
│   └── guide-fa.md                # Comprehensive technical documentation in Persian
├── package.json                   # Project metadata
├── LICENSE                        # MIT License
└── README.md                      # This documentation
```


---

## 🤝 Contributing
Contributions, suggestions, and feature requests are welcome! Feel free to open an issue or submit a pull request.

## 📄 License
This project is licensed under the [MIT License](LICENSE).
