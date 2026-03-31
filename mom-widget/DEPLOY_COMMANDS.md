# Deploy MoM Widget to GitHub Pages - Run These Commands

**Estimated time:** 2-3 minutes total

## Step 1: Create the Repository on GitHub

Go to: **https://github.com/new**

Fill in:
- **Repository name:** `mom-widget`
- **Description:** Millions of Microbusinesses Business Widget for partner portals
- **Make this repository public:** ✅ Check this (required for free Pages)
- Click **"Create repository"**

## Step 2: Push Your Code to GitHub

In your terminal, run these commands:

```bash
# Navigate to the widget directory
cd /Users/mikekirkwood/.openclaw/workspace/mom-widget

# Add all the important files
git add embed.html config.js README.md DEPLOYMENT_GUIDE.md

# Commit them
git commit -m "Initial MoM Widget deployment"

# Connect to your new GitHub repo (replace YOUR_USERNAME with mikekirkwood)
git remote add origin https://github.com/mikekirkwood/mom-widget.git

# Push to GitHub
git push -u origin main
```

**Note:** When prompted for credentials, use:
- **Username:** `mikekirkwood`  
- **Password:** Your GitHub password (or Personal Access Token if you have 2FA enabled)

## Step 3: Enable GitHub Pages

1. Go to your repository: https://github.com/mikekirkwood/mom-widget
2. Click **"Settings"** in the top menu
3. Click **"Pages"** in the left sidebar
4. Under **"Source"**, select:
   - **Branch:** `main`
   - **Folder:** `/ (root)`
5. Click **"Save"**

## ✅ Done!

GitHub will deploy your site within 1-2 minutes. You'll get a URL like:

```
https://mikekirkwood.github.io/mom-widget/
```

The widget is available at:
```
https://mikekirkwood.github.io/mom-widget/embed.html
```

## Testing Before Deployment

Before pushing, test locally with this command:

```bash
open /Users/mikekirkwood/.openclaw/workspace/mom-widget/test_embed.html
```

This opens a page that simulates how the widget will work when embedded on your site.

---

**Once you've completed these steps**, let me know and I'll help test embedding it on carpenterhillcreamery.com!
