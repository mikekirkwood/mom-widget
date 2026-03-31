#!/bin/bash
# Automated GitHub Pages Deployment Script
# Run this to deploy the widget to your GitHub repository

set -e

echo "🚀 MoM Widget - GitHub Pages Deployment"
echo "========================================="
echo ""

REPO_DIR="/Users/mikekirkwood/.openclaw/workspace/mom-widget"
cd "$REPO_DIR"

# Check if we have a remote already configured
if git remote get-url origin &> /dev/null; then
    echo "✅ Repository already connected to GitHub"
else
    echo "❌ No GitHub repository found!"
    echo ""
    echo "You need to create one first:"
    echo "1. Go to https://github.com/new"
    echo "2. Create a new public repository (name it 'mom-widget' or similar)"
    echo "3. Run this script again after creating the repo"
    exit 1
fi

echo ""
echo "📝 Checking files..."
if [ ! -f "embed.html" ]; then
    echo "❌ embed.html not found!"
    exit 1
fi
echo "✅ embed.html ready"

echo ""
echo "🔄 Making final commit..."
git add -A
git diff --cached --quiet || git commit -m "Deploy widget to GitHub Pages [ci skip]"

echo ""
echo "⬆️  Pushing to GitHub..."
git push origin main

echo ""
echo "✅ Deployed successfully!"
echo ""
echo "🌐 Next steps:"
echo "1. Go to your repository on GitHub"
echo "2. Click Settings → Pages (left sidebar)"
echo "3. Set Source to: Branch 'main' / Folder '/ (root)'"
echo "4. Save and wait 1-2 minutes for deployment"
echo ""
echo "Then you'll get a URL like:"
echo "https://YOUR_USERNAME.github.io/mom-widget/"
echo ""
