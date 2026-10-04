# Antigravity RTL 🇮🇷 🇦🇪

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![IDE: Google Antigravity](https://img.shields.io/badge/Google-Antigravity%20IDE-purple.svg)](https://antigravity.google)
[![Language: Persian / Arabic / RTL](https://img.shields.io/badge/Support-Persian%20%7C%20Arabic%20%7C%20RTL-brightgreen.svg)](#)

> **درمان جامع و همیشگی مشکل راست‌چین‌سازی (RTL) و به‌هم‌ریختگی متن‌های دوجهته (BiDi) در محیط Google Antigravity IDE.**  
> حل ریشه‌ای پرش علائم نگارشی، جابه‌جایی پرانتزها و تداخل کلمات فارسی و انگلیسی در پنل چت و محیط کدنویسی.

---

[راهنمای فارسی](#راهنمای-فارسی) | [English Documentation](#english-guide)

---

<a name="راهنمای-فارسی"></a>
## 🇮🇷 راهنمای فارسی

### ریشه مشکل چیست؟
محیط چت و پنل هوش مصنوعی در **Google Antigravity IDE** از وب‌ویوهای مبتنی بر Chromium با جهت پایه چپ‌چین (`direction: ltr`) استفاده می‌کند. در متون فارسی که شامل اعداد (`1.`)، پرانتز یا کلمات انگلیسی (نظیر `API` یا `POST /prompt`) باشند:
- پرانتزها و علائم نگارشی به اشتباه معکوس می‌شوند.
- کلمات انگلیسی نظم جمله را به هم می‌زنند.
- لیست‌ها و بالت‌پوینت‌ها در جای نادرست چپ نمایش داده می‌شوند.

این پکیج یک راهکار جامع در دو لایه استایل هسته نرم‌افزار و دستورالعمل‌های رفتاری هوش مصنوعی ارائه می‌دهد تا مشکل برای همیشه حل شود.

---

### ویژگی‌های کلیدی
- 🎯 **درمان دائمی هسته نرم‌افزار (Permanent IDE Patch):** تزریق هوشمند کدهای CSS به استایل‌های هسته Antigravity IDE با قابلیت تشخیص خودکار (`unicode-bidi: plaintext`).
- 💎 **حفظ قطعی کدها و پایپ‌لاین‌ها:** تمام بلاک‌های کد (`pre`, `code`) و نمودارهای Mermaid بدون تغییر به صورت چپ‌چین (LTR) استاندارد باقی می‌مانند.
- 🔤 **فونت استاندارد وزیرمتن (Vazirmatn):** لود فونت محبوب وزیرمتن برای زیبایی حداکثری متون فارسی.
- 🤖 **قوانین سراسری هوش مصنوعی (Global AI Rules):** دستورالعمل دائمی برای تمام چت‌ها در `~/.gemini/config/rules/persian-rtl.md`.
- ⚡ **اسکریپت تک‌خطی کنسول:** امکان اجرا و تست آنی در تب Console بدون نیاز به تغییر فایل‌ها.

---

### روش‌های نصب و استفاده

#### روش ۱: نصب دائمی و همیشگی (توصیه‌شده)
کافیست دستور زیر را با پایتون اجرا کنید:
```bash
python scripts/install-permanent.py
```
یا با پاورشل:
```powershell
.\scripts\install.ps1
```
سپس در نرم‌افزار Antigravity IDE کلیدهای **`Ctrl + Shift + P`** را زده و دستور **`Developer: Reload Window`** را انتخاب کنید.

#### روش ۲: استفاده سریع در کنسول مرورگر (DevTools Snippet)
1. در نرم‌افزار Antigravity IDE کلیدهای **`Ctrl + Shift + I`** را فشار دهید.
2. به تب **Console** بروید.
3. محتوای فایل [`scripts/devtools-snippet.js`](scripts/devtools-snippet.js) را کپی و Paste کنید و Enter بزنید.

---

<a name="english-guide"></a>
## 🌐 English Guide

### The Problem
Google Antigravity IDE uses Chromium/Electron webviews for its Chat and Scratchpad panels. By default, chat containers inherit `direction: ltr`. When Persian or Arabic text contains Latin terms, numbers, or parentheses, Chromium's Bidirectional (BiDi) algorithm flips punctuation marks, displaces closing parentheses, and scrambles mixed sentences.

### Solution Architecture
1. **Permanent Stylesheet Patching (`scripts/install-permanent.py`)**: Automatically injects `unicode-bidi: plaintext` and explicit RTL rules directly into Antigravity IDE's core webview stylesheets (`jetskiAgent/main.css` and `workbench.desktop.main.css`).
2. **AI Agent Behavioral Rules (`agent-rules/persian-rtl.md`)**: Configures the global agent environment (`~/.gemini/config/rules/`) to wrap Persian blocks in explicit `<div dir="rtl">` tags and use Persian numerals (`۱، ۲، ۳`).
3. **Safe LTR Isolation**: Guarantees that `<pre>`, `<code>`, Monaco editors, and Mermaid diagrams remain strictly LTR.

---

## 📂 ساختار مخزن (Repository Structure)

```text
antigravity-rtl/
├── css/
│   └── antigravity-rtl.css        # استایل‌های بهینه‌سازی شده راست‌چین و فونت وزیرمتن
├── scripts/
│   ├── install-permanent.py       # اسکریپت پایتون برای نصب دائمی روی هسته نرم‌افزار
│   ├── install.ps1                # نصب‌کننده پاورشل برای ویندوز
│   ├── uninstall.ps1              # بازگردانی فایل‌های نسخه پشتیبان به حالت اولیه
│   └── devtools-snippet.js        # اسکریپت آزمایشی جهت اجرا در کنسول DevTools
├── agent-rules/
│   ├── persian-rtl.md             # قانون سراسری برای ایجنت‌های هوش مصنوعی
│   └── GEMINI.md                  # الگوی پیکربندی برای پروژه‌ها
├── docs/
│   └── guide-fa.md                # مستندات تفصیلی و فنی به زبان فارسی
├── package.json                   # اطلاعات و متادیتای پکیج
├── LICENSE                        # مجوز متن‌باز MIT
└── README.md                      # راهنمای اصلی پروژه
```


---

## 📄 مجوز (License)
این پروژه تحت مجوز [MIT License](LICENSE) منتشر شده است.
