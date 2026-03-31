// MoM Widget Configuration
// Update these values with your actual Supabase credentials

export const SUPABASE_CONFIG = {
  url: 'https://fuojtoajrhzgfsqzzdtn.supabase.co', // Replace with your Supabase project URL
  anonKey: 'sb_publishable_8V-Xa9KGTfHoQ8IJxnj_2A_IXA-ITtn'          // Replace with anon/public key (NOT service role!)
};

// Business access configuration
// Add all portfolio companies here with their email and role
export const BUSINESS_ACCESS = {
  // Supplier accounts (can update products, see orders)
  'carpenterhill@eek.com': {
    name: 'Carpenter Hill',
    role: 'supplier'
  },

  // Partner accounts (can place SB2SB orders)
  'staplesfarm@eek.com': {
    name: 'Staples Farm Dairy',
    role: 'partner'
  },

  // Add more businesses here...
  // 'businessname@eek.com': {
  //   name: 'Business Display Name',
  //   role: 'partner' // or 'supplier' for those who sell products
  // }
};

// Optional: Custom branding
export const BRANDING = {
  hubName: 'Regenerative Local Loop Food Hub',
  description: 'Connect with local farmers, producers, and businesses in our sustainable ecosystem.',
  primaryColor: '#667eea',
  gradientFrom: '#667eea',
  gradientTo: '#764ba2'
};
