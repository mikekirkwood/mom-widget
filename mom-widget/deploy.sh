#!/bin/bash
# MoM Widget Deployment Script
# Run this after making changes to deploy the widget

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE="/Users/mikekirkwood/.openclaw/workspace"

echo "🌱 MoM Widget Deployment Script"
echo "================================"
echo ""

# Check if embed.html exists
if [ ! -f "$SCRIPT_DIR/embed.html" ]; then
    echo "❌ Error: embed.html not found in $SCRIPT_DIR"
    exit 1
fi

# Validate HTML syntax (basic check)
echo "🔍 Validating HTML..."
if grep -q "<html" "$SCRIPT_DIR/embed.html" && \
   grep -q "</html>" "$SCRIPT_DIR/embed.html"; then
    echo "✅ HTML structure looks good"
else
    echo "⚠️  Warning: HTML may be incomplete"
fi

# Check for required elements
REQUIRED_ELEMENTS=(
    "<style>"
    "BUSINESS_KEYS"
    "handleLogin"
    "showRegister"
)

for element in "${REQUIRED_ELEMENTS[@]}"; do
    if grep -q "$element" "$SCRIPT_DIR/embed.html"; then
        echo "✅ Found: $element"
    else
        echo "❌ Missing: $element"
        exit 1
    fi
done

echo ""
echo "📁 Files in widget directory:"
ls -la "$SCRIPT_DIR"/*.html 2>/dev/null || echo "No HTML files found"
echo ""

# Check if Supabase schema exists
if [ -f "$WORKSPACE/supabase-schema.sql" ]; then
    echo "✅ Supabase schema file present"
    echo "   Run this in your Supabase SQL Editor:"
    echo "   cat $WORKSPACE/supabase-schema.sql | psql -h db.<project-ref>.supabase.co -U postgres"
else
    echo "⚠️  Warning: supabase-schema.sql not found"
fi

echo ""
echo "🎯 Next Steps:"
echo "1. Open: $SCRIPT_DIR/test_embed.html in your browser to test"
echo "2. Deploy embed.html to your website or static hosting service"
echo "3. Set up iframe on your site with height constraint (e.g., height='700px')"
echo "4. Run supabase-schema.sql in Supabase SQL Editor"
echo ""

# Offer to open test page
read -p "Open test_embed.html in browser? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "🌐 Opening test page..."
    if command -v open &> /dev/null; then
        open "$SCRIPT_DIR/test_embed.html"
    elif command -v xdg-open &> /dev/null; then
        xdg-open "$SCRIPT_DIR/test_embed.html"
    else
        echo "ℹ️  Manual: Open $SCRIPT_DIR/test_embed.html in your browser"
    fi
fi

echo ""
echo "✅ Deployment check complete!"
