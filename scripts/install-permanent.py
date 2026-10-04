#!/usr/bin/env python3
"""
Antigravity RTL - Permanent System Installer
نصب‌کننده دائمی و سراسری راست‌چین برای محیط Google Antigravity IDE
"""
import os
import sys
import shutil

if sys.platform == "win32":
    try:
        sys.stdout.reconfigure(encoding="utf-8", errors="replace")
        sys.stderr.reconfigure(encoding="utf-8", errors="replace")
    except Exception:
        pass

print("=" * 65)
print(" 🚀 نصب‌کننده دائمی راست‌چین برای Google Antigravity IDE")
print("=" * 65)

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_DIR = os.path.abspath(os.path.join(SCRIPT_DIR, ".."))

# 1. Global AI Rules installation
user_home = os.path.expanduser("~")
global_config_dir = os.path.join(user_home, ".gemini", "config")
global_rules_dir = os.path.join(global_config_dir, "rules")
os.makedirs(global_rules_dir, exist_ok=True)

source_rule = os.path.join(REPO_DIR, "agent-rules", "persian-rtl.md")
dest_rule = os.path.join(global_rules_dir, "persian-rtl.md")
if os.path.exists(source_rule):
    shutil.copy2(source_rule, dest_rule)
    print(f" [✓] قانون هوش مصنوعی در مسیر سراسری نصب شد:\n     -> {dest_rule}")

# Global GEMINI.md
source_gemini = os.path.join(REPO_DIR, "agent-rules", "GEMINI.md")
dest_gemini = os.path.join(global_config_dir, "GEMINI.md")
if os.path.exists(source_gemini):
    shutil.copy2(source_gemini, dest_gemini)
    print(f" [✓] فایل GEMINI.md سراسری به‌روزرسانی شد:\n     -> {dest_gemini}")

# 2. Patching Antigravity IDE Stylesheets
css_snippet = """
/* === ANTIGRAVITY PERMANENT RTL FIX START === */
:is([class*="chat"], [class*="message"], [class*="markdown"], [class*="jetski"], .rendered-markdown, .markdown-body) :is(p, li, h1, h2, h3, h4, h5, h6, blockquote) {
  unicode-bidi: plaintext !important;
  text-align: start !important;
}

[dir="rtl"], .rtl, [data-direction="rtl"], div[dir="rtl"], div[dir="rtl"] p, div[dir="rtl"] li {
  direction: rtl !important;
  text-align: right !important;
  unicode-bidi: plaintext !important;
}

[dir="rtl"] ul, [dir="rtl"] ol, .rtl ul, .rtl ol {
  padding-right: 1.5rem !important;
  padding-left: 0.5rem !important;
  direction: rtl !important;
  text-align: right !important;
}

pre, code, [class*="code-block"], .monaco-editor, .monaco-workbench .part.editor {
  direction: ltr !important;
  text-align: left !important;
  unicode-bidi: normal !important;
}
/* === ANTIGRAVITY PERMANENT RTL FIX END === */
"""

app_data = os.environ.get("LOCALAPPDATA", "")
ide_dir = os.path.join(app_data, "Programs", "Antigravity IDE", "resources", "app", "out")

css_targets = [
    os.path.join(ide_dir, "jetskiAgent", "main.css"),
    os.path.join(ide_dir, "jetskiMain.tailwind.css"),
    os.path.join(ide_dir, "vs", "workbench", "workbench.desktop.main.css")
]

for target in css_targets:
    if os.path.exists(target):
        try:
            bak = target + ".bak"
            if not os.path.exists(bak):
                shutil.copy2(target, bak)
                print(f" [✓] نسخه پشتیبان تهیه شد: {os.path.basename(bak)}")
            
            with open(target, "r", encoding="utf-8", errors="ignore") as f:
                content = f.read()

            start_tag = "/* === ANTIGRAVITY PERMANENT RTL FIX START === */"
            end_tag = "/* === ANTIGRAVITY PERMANENT RTL FIX END === */"

            if start_tag in content and end_tag in content:
                s_idx = content.find(start_tag)
                e_idx = content.find(end_tag) + len(end_tag)
                content = content[:s_idx] + css_snippet.strip() + content[e_idx:]
            else:
                content += "\n" + css_snippet.strip() + "\n"

            with open(target, "w", encoding="utf-8") as f:
                f.write(content)
            print(f" [✓] استایل‌های راست‌چین به {os.path.basename(target)} تزریق شد.")
        except Exception as e:
            print(f" [!] خطا در تزریق استایل به {target}: {e}")

print("=" * 65)
print(" 🎉 عملیات نصب با موفقیت انجام شد!")
print(" برای اعمال در نرم‌افزار، کلیدهای Ctrl+Shift+P را زده و 'Reload Window' را انتخاب کنید.")
print("=" * 65)
