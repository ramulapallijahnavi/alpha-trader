# Database Setup Guide for Alpha FX Trader

## Step 1: Create Supabase Project
1. Go to https://supabase.com
2. Sign up/Login and create a new project
3. Choose a project name and database password
4. Wait for the project to be created

## Step 2: Get Project Credentials
1. In your Supabase dashboard, go to Settings > API
2. Copy your Project URL (looks like: https://your-project-id.supabase.co)
3. Copy your anon/public key (starts with eyJ...)

## Step 3: Configure Environment Variables
Create a `.env.local` file in your project root with:
```
VITE_SUPABASE_URL=https://your-project-id.supabase.co
VITE_SUPABASE_ANON_KEY=your-anon-key-here
```

## Step 4: Set Up Database Schema
1. In your Supabase dashboard, go to SQL Editor
2. Copy and paste the entire content from `database-schema.sql`
3. Click "Run" to execute the SQL commands
4. This will create all necessary tables and security policies

## Step 5: Enable Authentication
1. In Supabase dashboard, go to Authentication > Settings
2. Enable email authentication
3. Configure any additional auth settings as needed

## Step 6: Test the Application
1. Restart your development server: `npm run dev`
2. Try creating a new account
3. Check your Supabase dashboard to see if data is being saved

## Database Tables Created:
- **users**: User profiles and account information
- **trading_accounts**: Trading balances and statistics
- **trades**: Active trades
- **trade_history**: Completed trades history

## Security Features:
- Row Level Security (RLS) enabled
- Users can only access their own data
- Automatic timestamp updates
- Data validation and constraints

## Troubleshooting:
- Make sure your environment variables are correct
- Check that the SQL schema was executed successfully
- Verify that RLS policies are active
- Check browser console for any error messages
