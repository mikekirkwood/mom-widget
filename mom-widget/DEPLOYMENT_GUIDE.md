# MoM Widget Deployment Guide

## Current Status

✅ **Local testing works** - The debug_widget.html loads correctly when opened directly in a browser.

❌ **Production issue** - The widget doesn't work when embedded on carpenterhillcreamery.com.

## Root Cause Analysis

### The Problem
The button exists but is non-functional with no visible "Sign Up" or "Log In" functionality. This typically indicates one of three issues:

1. **CORS Blockade (Most Likely)** - When the widget loads from a different origin than its API, browser security blocks the Supabase API calls
2. **JavaScript Execution Failure** - The HTML is there but JS isn't running
3. **Container/IFrame Issues** - The widget exists but can't interact with its container

### Why This Happens
When you embed an iframe like this:
```html
<iframe src="https://carpenterhillcreamery.com/widget/embed.html"></iframe>
```

The browser checks if the Supabase API (`fuojtoajrhzgfsqzzdtn.supabase.co`) is allowed to receive requests from `carpenterhillcreamery.com`. If not, it blocks them silently.

## Solution Options

### Option A: Self-Hosted Widget (Recommended for MVP)
**Best for:** Immediate deployment without CORS issues

Move the entire widget HTML into carpenterhillcreamery.com's codebase directly, rather than using an iframe.

**Steps:**
1. Copy the full widget HTML from `embed.html` 
2. Add it to carpenterhillcreamery.com's footer section (or wherever you want it)
3. Ensure Supabase JS library loads on that page:
   ```html
   <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>
   ```
4. Use the SAME Supabase URL and ANON key in your embedded code

**Advantages:**
- No CORS issues (same origin)
- Faster loading
- Better user experience (seamless integration)
- Easier to debug

### Option B: Fix CORS on Supabase Side
**Best for:** If you MUST use iframe embedding

Enable proper CORS headers in your Supabase project settings.

**Steps:**
1. Go to Supabase Dashboard → Project Settings → API
2. Add `https://carpenterhillcreamery.com` to allowed origins (if available)
3. OR configure custom CORS headers for the Supabase domain

**Note:** This requires Supabase project admin access and may not be possible if you don't control those settings.

### Option C: Use Proxy/Backend
**Best for:** Production deployments with full control

Set up a simple backend proxy on carpenterhillcreamery.com that forwards requests to Supabase.

**Steps:**
1. Create an endpoint like `https://carpenterhillcreamery.com/api/supabase-proxy`
2. This endpoint makes server-side calls to Supabase (no CORS issues!)
3. Widget sends requests to your proxy instead of directly to Supabase

## Quick Test: Which Issue Is It?

Run this in your browser console on carpenterhillcreamery.com:

```javascript
// Check if the widget container exists
document.getElementById('widget-container') !== null

// Check for JavaScript errors in the console (look for red text)
// These would indicate JS execution failures

// Test Supabase connection directly from the page
fetch('https://fuojtoajrhzgfsqzzdtn.supabase.co/rest/v1/partner_products?select=count&count=exact')
  .then(r => r.json())
  .then(console.log)
  .catch(e => console.error('CORS error:', e))
```

If you see a CORS error in the console, that's your issue.

## Recommended Next Steps

1. **Immediate:** Try Option A (self-hosted widget) - it's the fastest fix
2. **Short-term:** Run the quick test above to confirm if it's a CORS issue
3. **Long-term:** Consider setting up proper backend proxy for production

## Files Reference

- `embed.html` - The main widget code (for copying into carpenterhillcreamery.com)
- `debug_widget.html` - Debug version with console logging
- `test_embed.html` - Test page for iframe embedding
- `deploy_to_github_pages.sh` - Deployment script to GitHub Pages

## Need Help?

Share a screenshot of:
1. Browser console errors (press F12 → Console tab)
2. Network tab showing failed requests (look for red CORS errors)
3. The exact location where the widget is embedded on carpenterhillcreamery.com

This will help pinpoint the exact issue!
