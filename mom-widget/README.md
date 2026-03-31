# MoM Widget - Regenerative Local Loop Food Hub

A self-service business portal for the Millions of Microbusinesses ecosystem, enabling B2B ordering, product discovery, and partner access management.

## Quick Start

### 1. Set Up Supabase Database

Run this SQL in your Supabase SQL Editor:

```bash
# Navigate to workspace directory
cd /Users/mikekirkwood/.openclaw/workspace

# Run the schema (requires psql or Supabase CLI)
psql -h db.<project-ref>.supabase.co -U postgres < supabase-schema.sql
```

Or paste `supabase-schema.sql` directly into the Supabase SQL Editor at: https://app.supabase.com/project/YOUR_PROJECT/sql

### 2. Deploy the Widget

The widget is a single HTML file with embedded CSS and JavaScript:

**File to deploy:** `/mom-widget/embed.html`

#### Option A: Host on your website (recommended)
```html
<!-- Add this to carpenterhillcreamery.com or any page -->
<iframe 
  src="/mom-widget/embed.html" 
  width="100%" 
  height="700px" 
  frameborder="0">
</iframe>
```

#### Option B: Use a static hosting service
- Upload `embed.html` to Netlify, Vercel, or GitHub Pages
- Update the iframe src with your hosted URL

### 3. Configure Business Access Keys

The widget uses hardcoded business keys for demonstration. To customize:

Edit `/Users/mikekirkwood/.openclaw/workspace/mom-widget/embed.html`:

```javascript
const BUSINESS_KEYS = {
    'carpenterhill@eek.com': { 
        name: 'Carpenter Hill', 
        role: 'supplier' 
    },
    // ... add more businesses as needed
};
```

## Features

### Marketing View (Unlogged)
- Beautiful gradient landing page
- Call-to-action buttons for login and registration
- Responsive design with smooth animations

### Login Flow
- Email-based authentication (mock)
- Role-based dashboard access
- Session persistence via localStorage

### Dashboard Views
- **Product Catalog**: Browse all products from suppliers
- **Order Management**: Create, view, and manage orders
- **Access Requests**: Submit new business applications
- **Pending Approvals**: Review incoming requests (admin only)

### Order System
- Add/remove items to cart
- Calculate totals automatically
- Track order status (draft → pending → confirmed → shipped → delivered)
- Unique order numbers (MoM-001, MoM-002, etc.)

## Testing

Open the test page in your browser:
```bash
open /Users/mikekirkwood/.openclaw/workspace/mom-widget/test_embed.html
```

Or serve locally with any HTTP server:
```bash
cd /Users/mikekirkwood/.openclaw/workspace/mom-widget
python3 -m http.server 8000
# Then visit http://localhost:8000/test_embed.html
```

## Customization

### Styling
All styles are in the `<style>` block at the top of `embed.html`. Key classes:
- `.marketing-view` - Landing page styling
- `.login-view`, `.register-view` - Form containers
- `.dashboard-view` - Main dashboard area
- Tables and badges for data display

### Colors
Primary gradient colors (line 15):
```css
background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
```

Change to match your brand palette.

### Business Integration
Add your businesses to the `BUSINESS_KEYS` object and populate the Supabase database with real products using the seed data in `supabase-schema.sql`.

## Security Notes

⚠️ **This is a demo version** - For production use:

1. Implement proper authentication (OAuth, JWT tokens)
2. Add CSRF protection for form submissions
3. Validate all inputs server-side
4. Use HTTPS everywhere
5. Implement rate limiting on API endpoints
6. Store secrets in environment variables, not hardcoded

## Support

Questions or issues? Check the console logs for errors or contact your development team.

---

**Created:** March 2026  
**Version:** 1.0  
**License:** Internal use only
