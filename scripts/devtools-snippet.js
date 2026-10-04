/**
 * Antigravity RTL - DevTools Console Snippet
 * Usage:
 * 1. Open Google Antigravity IDE.
 * 2. Press Ctrl + Shift + I (or Help -> Toggle Developer Tools).
 * 3. Go to the "Console" tab.
 * 4. Paste this code and press Enter.
 *
 * Tip: You can save this in DevTools -> Sources -> Snippets for 1-click execution.
 */

(function applyAntigravityRTL() {
  const STYLE_ID = 'antigravity-rtl-style';
  const existing = document.getElementById(STYLE_ID);

  if (existing) {
    existing.remove();
    console.log('%c[Antigravity RTL] RTL styles toggled OFF.', 'color: #ff9800; font-weight: bold;');
    return;
  }

  const css = `
    @import url('https://cdn.jsdelivr.net/gh/rastikerdar/vazirmatn@v33.003/Vazirmatn-font-face.css');

    [class*="chat-message"],
    [class*="scratchpad"],
    [class*="rendered-markdown"],
    .monaco-workbench .part.sidebar .chat-container,
    div[data-testid*="chat"],
    .markdown-body {
      font-family: 'Vazirmatn', -apple-system, BlinkMacSystemFont, 'Segoe UI', Tahoma, sans-serif !important;
    }

    [class*="rendered-markdown"] p,
    [class*="rendered-markdown"] li,
    [class*="rendered-markdown"] h1,
    [class*="rendered-markdown"] h2,
    [class*="rendered-markdown"] h3,
    [class*="rendered-markdown"] h4,
    [class*="rendered-markdown"] h5,
    [class*="rendered-markdown"] h6,
    [class*="rendered-markdown"] blockquote,
    [class*="message-body"] p,
    [class*="message-body"] li,
    .chat-message-content p,
    .chat-message-content li {
      direction: rtl !important;
      text-align: right !important;
      unicode-bidi: plaintext !important;
      line-height: 1.8 !important;
    }

    [class*="rendered-markdown"] ul,
    [class*="rendered-markdown"] ol,
    .chat-message-content ul,
    .chat-message-content ol {
      padding-right: 1.5rem !important;
      padding-left: 0.5rem !important;
      direction: rtl !important;
      text-align: right !important;
    }

    pre, pre code, code, .monaco-editor, .terminal, .xterm, [class*="code-block"], svg, .mermaid {
      direction: ltr !important;
      text-align: left !important;
      unicode-bidi: isolate !important;
    }

    p code, li code {
      direction: ltr !important;
      unicode-bidi: embed !important;
      display: inline-block;
    }
  `;

  const styleEl = document.createElement('style');
  styleEl.id = STYLE_ID;
  styleEl.innerHTML = css;
  document.head.appendChild(styleEl);

  console.log('%c[Antigravity RTL] RTL styles successfully applied! %c✓', 'color: #4caf50; font-weight: bold;', 'color: #4caf50; font-size: 14px;');
})();
