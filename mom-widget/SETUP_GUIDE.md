# MoM Widget Setup Guide

## Quick Start

The widget is built with **three states**:

1. **Unlogged (Marketing)**: "Join our regenerative local loop food hub" - for visitors
2. **Supplier Login** (e.g., Carpenter Hill): Update products, see orders from partners like Staples Farm Dairy
3. **Partner Login** (SB2B marketplace): Browse and order from suppliers in the network

## Configuration Steps

### 1. Update Supabase Credentials

Edit `/Users/mikekirkwood/.openclaw/workspace/mom-widget/embed.html` lines ~180-181:

```javascript
const SUPABASE_URL = 'https://your-project.supabase.co'; // Your actual URL
const SUPABASE_ANON_KEY = 'your-anon-key-here';           // Your anon key (NOT service role!)
```

**Where to find these:**
- Go to your Supabase project → Settings → API
- Copy "Project URL" and "anon public" key
- ⚠️ Never use the service role key in client-side code!

### 2. Add Your Businesses

In `embed.html`, update the `BUSINESS_KEYS` object (around line ~184):

```javascript
const BUSINESS_KEYS = {
  'carpenterhill@eek.com': { name: 'Carpenter Hill', role: 'supplier' },
  'staplesfarm@eek.com': { name: 'Staples Farm Dairy', role: 'partner' },
  
  // Add more businesses...
  // 'businessname@eek.com': { name: 'Display Name', role: 'partner' }
};
```

**Roles:**
- `supplier`: Can update products, see orders they receive
- `partner`: Can browse marketplace and place SB2B orders

### 3. Test Locally

Open the file in a browser:
```bash
open /Users/mikekirkwood/.openclaw/workspace/mom-widget/embed.html
```

Or serve it properly:
```bash
cd /Users/mikekirkwood/.openclaw/workspace/mom-widget
npx serve .
# Then visit http://localhost:3000
```

### 4. Deploy to Google Sites

1. Go to your Google Site editor
2. Click **Insert** → **Embed**
3. Choose **By URL** if hosted, or **Upload Files** for direct embed
4. Paste the path or upload `embed.html`
5. Adjust iframe size as needed

## Database Schema Requirements

The widget expects these tables in Supabase:

### `partners` (already exists from your eek-partner-portal)
```sql
id, business_name, email, verification_status, status, ...
```

### `partner_products` (already exists)
```sql
id, product_name, sku, category, wholesale_price, 
available, seller_partner_id, ...
```

### `orders` and `order_items` (already exists)
```sql
-- Orders table needs: id, order_number, status, total_amount, created_at, partner_id
-- Order items need: id, order_id, product_id, quantity, unit_price
```

## Testing the Three States

### 1. Unlogged View
- Open the widget without logging in
- Should see marketing message with "Log In" button

### 2. Supplier Dashboard (Carpenter Hill)
- Log in as `carpenterhill@eek.com`
- See list of products they sell
- See orders from Staples Farm Dairy (or other partners)
- Can update product availability/pricing (UI ready, needs backend hooks)

### 3. Partner Marketplace (Staples Farm)
- Log in as `staplesfarm@eek.com`
- Browse available products from suppliers
- Click "Order" to place SB2B orders
- See order history

## Next Steps for Full Implementation

1. **Backend Integration**: Connect product updates and order creation to Supabase
2. **Authentication**: Add proper email/password login or API key validation
3. **Product Management UI**: Build forms for suppliers to add/edit products
4. **Order Flow**: Complete the ordering workflow with confirmation emails
5. **Multi-business Onboarding**: Create a way to invite new businesses to the network

## Troubleshooting

**Widget not loading:**
- Check browser console (F12) for errors
- Verify Supabase URL and key are correct
- Ensure CORS is enabled in Supabase settings

**Database queries failing:**
- Check RLS policies allow anonymous reads on `partner_products`
- Verify table names match exactly
- Test with Supabase Dashboard's SQL editor first

**Login not working:**
- Email must exist in `BUSINESS_KEYS` object
- Console should show "User logged in" when successful
- Check email format matches what you configured

## Support

Questions? Review the code comments or check:
- [Supabase Docs](https://supabase.com/docs)
- Widget code at `/Users/mikekirkwood/.openclaw/workspace/mom-widget/embed.html`
