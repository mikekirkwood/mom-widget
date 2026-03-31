# MoM Widget - Quick Start Guide

## Step 1: Set Up Supabase Database (5 minutes)

### Option A: Using Supabase Web UI (Easiest)

1. Go to https://app.supabase.com and select your project
2. Click **"SQL Editor"** in the left sidebar
3. Open `/Users/mikekirkwood/.openclaw/workspace/supabase-schema.sql` in a text editor
4. Copy all content and paste into the SQL Editor
5. Click **"Run"** (or Cmd/Ctrl + Enter)

You should see:
- ✅ All tables created successfully
- ✅ 12 partners inserted
- ✅ Products catalog populated
- ✅ Sample orders added
- ✅ Access requests seeded

### Option B: Using psql CLI

```bash
# Install Supabase CLI if needed
brew install supabase/tap/supabase

# Login to your project
supabase login
supabase link --project-ref <your-project-ref>

# Run the schema
psql -h db.<your-project-ref>.supabase.co \
     -U postgres \
     -d postgres \
     -f /Users/mikekirkwood/.openclaw/workspace/supabase-schema.sql
```

## Step 2: Test the Widget Locally (2 minutes)

### Method A: Open test page directly
```bash
open /Users/mikekirkwood/.openclaw/workspace/mom-widget/test_embed.html
```

This opens a test page with an iframe containing your widget. You can:
- Click "Log In to Your Business" 
- Try logging in as `carpenterhill@eek.com` (mock login)
- Browse products, create orders, submit access requests

### Method B: Run local server
```bash
cd /Users/mikekirkwood/.openclaw/workspace/mom-widget
python3 -m http.server 8000
# Then visit: http://localhost:8000/test_embed.html
```

## Step 3: Deploy to Your Website (2 minutes)

### For carpenterhillcreamery.com or any site:

Add this HTML where you want the widget to appear:

```html
<iframe 
  src="/mom-widget/embed.html" 
  width="100%" 
  height="700px" 
  frameborder="0">
</iframe>
```

**Important:** The `height` attribute is **required**. Without it, the widget may not display properly.

### Alternative: Host on static hosting service

Upload `embed.html` to Netlify/Vercel/GitHub Pages, then use:

```html
<iframe 
  src="https://your-domain.com/embed.html" 
  width="100%" 
  height="700px" 
  frameborder="0">
</iframe>
```

## Step 4: Customize (Optional)

### Update business access keys

Edit `/Users/mikekirkwood/.openclaw/workspace/mom-widget/embed.html` and find the `BUSINESS_KEYS` object around line 35. Add your businesses:

```javascript
const BUSINESS_KEYS = {
    'your-email@eek.com': { 
        name: 'Your Business Name', 
        role: 'supplier' // or 'partner'
    },
    // ... more businesses
};
```

### Change colors

Find the CSS gradient around line 15 and update to match your brand:

```css
background: linear-gradient(135deg, #YOUR_COLOR_1 0%, #YOUR_COLOR_2 100%);
```

## Quick Troubleshooting

**Widget not displaying?**
- Check iframe has explicit `height` attribute (e.g., `height="700px"`)
- Verify embed.html is accessible at the URL you're using
- Open browser DevTools console for errors

**Forms not working?**
- Clear browser cache and refresh
- Check localStorage isn't blocked by privacy settings
- Try in incognito/private browsing mode

**Database empty after setup?**
- Verify SQL Editor ran without errors
- Check Supabase connection string is correct
- Re-run the schema file

## What You Should See

After completing all steps:

1. ✅ Test page opens with full widget visible (not cut off)
2. ✅ "Log In to Your Business" button works
3. ✅ Login form accepts email and shows dashboard
4. ✅ Product catalog displays Carpenter Hill products
5. ✅ Can add items to cart and create orders
6. ✅ Access request form works

## Next Steps

- Add real product inventory from your businesses
- Set up email notifications for new orders/access requests  
- Implement proper authentication (currently mock-based)
- Connect payment processing for order checkout

---

**Need help?** Check `README.md` or open the console in DevTools to see error messages.
