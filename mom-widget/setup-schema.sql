-- Run this SQL in your Supabase SQL Editor to create the access_requests table
-- This stores business registration requests for admin review

CREATE TABLE IF NOT EXISTS access_requests (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  email TEXT NOT NULL UNIQUE,
  business_name TEXT NOT NULL,
  business_type TEXT NOT NULL CHECK (business_type IN ('farm', 'processor', 'retailer', 'restaurant', 'cafe', 'other')),
  description TEXT NOT NULL,
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected')),
  admin_notes TEXT,
  requested_at TIMESTAMPTZ DEFAULT NOW(),
  reviewed_at TIMESTAMPTZ,
  reviewer_email TEXT
);

-- Add indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_access_requests_status ON access_requests(status);
CREATE INDEX IF NOT EXISTS idx_access_requests_requested_at ON access_requests(requested_at DESC);

-- Enable Row Level Security (RLS)
ALTER TABLE access_requests ENABLE ROW LEVEL SECURITY;

-- Policy: Anyone can INSERT (for registration form)
CREATE POLICY "Allow public insert" ON access_requests
  FOR INSERT WITH CHECK (true);

-- Policy: Only authenticated users with specific role can SELECT (admin view later)
CREATE POLICY "Admins can view requests" ON access_requests
  FOR SELECT USING (true); -- Will be refined based on auth setup

-- Optional: Add comment for documentation
COMMENT ON TABLE access_requests IS 'Business registration requests for MoM ecosystem';
COMMENT ON COLUMN access_requests.status IS 'Current status of the request (pending, approved, rejected)';
