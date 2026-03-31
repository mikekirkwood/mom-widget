# Quick GitHub Pages Deployment (Manual Steps)

## Why Manual?
Automating GitHub setup is complex. These 3 simple steps will get you live in under 5 minutes!

## Step 1: Create a New Repository on GitHub

1. Go to https://github.com/new
2. **Repository name:** `mom-widget` (or whatever you want)
3. **Make it Public** (required for free GitHub Pages)
4. Click "Create repository"

## Step 2: Push the Widget Code

Open your terminal and run these commands:

```bash
cd /Users/mikekirkwood/.openclaw/workspace/mom-widget

# Initialize git if needed (skip if already done)
git init

# Add all files
git add embed.html config.js README.md

# Commit
git commit -m "Initial widget deployment"

# Connect to GitHub (replace YOUR_USERNAME with your actual username)
git remote add origin https://github.com/YOUR_USERNAME/mom-widget.git

# Push to GitHub
git push -u origin main
```

**Note:** You'll be prompted for your GitHub credentials. If you have 2FA enabled, use a Personal Access Token instead of your password.

## Step 3: Enable GitHub Pages

1. Go to your repository on GitHub (e.g., https://github.com/YOUR_USERNAME/mom-widget)
2. Click **Settings** → **Pages** (left sidebar)
3. Under "Source", select:
   - Branch: `main`
   - Folder: `/ (root)`
4. Click **Save**

## ✅ Done!

GitHub will deploy your site within 1-2 minutes. You'll get a URL like:

```
https://YOUR_USERNAME.github.io/mom-widget/
```

You can then access the widget at:
```
https://YOUR_USERNAME.github.io/mom-widget/embed.html
```

## Embed on Your Website

Now you can add this iframe to carpenterhillcreamery.com (or any site):

```html
<iframe 
  src="https://YOUR_USERNAME.github.io/mom-widget/embed.html" 
  style="width: 100%; height: 700px; border: none;"
></iframe>
```

## Troubleshooting

**CORS errors?** - GitHub Pages has proper CORS headers, so this shouldn't happen!

**404 error?** - Wait 2-3 minutes after enabling Pages. It takes time to deploy.

**Can't push?** - Make sure you created the repository on GitHub first (Step 1).

## Testing Before Deploying

Before pushing, test locally:
```bash
open /Users/mikekirkwood/.openclaw/workspace/mom-widget/test_embed.html
```

This opens a page that simulates how the widget will work when embedded.

---

**That's it!** Once you have the GitHub Pages URL, share it and we can test embedding on your site!
