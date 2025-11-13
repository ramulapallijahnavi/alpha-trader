# 🗄️ MySQL Database Setup for Alpha FX Trader

## 📋 **MySQL Database Schema**

I've created a complete MySQL database schema for your Alpha FX Trader application. Here's what you need to do:

### **Step 1: Open MySQL Workbench**
1. Launch MySQL Workbench
2. Connect to your MySQL server
3. Create a new query tab

### **Step 2: Run the Database Schema**
Copy and paste the entire content from `mysql-database-schema.sql` into MySQL Workbench and execute it.

---

## 🗂️ **Database Tables Created**

### **1. `users` Table**
- **Purpose**: Stores user account information
- **Key Fields**:
  - `id` (VARCHAR(36)) - Unique user identifier
  - `email` (VARCHAR(255)) - User email (unique)
  - `name` (VARCHAR(255)) - User's full name
  - `user_type` (ENUM) - 'individual' or 'organization'
  - `base_currency` (VARCHAR(10)) - User's base currency
  - `initial_amount` (DECIMAL(15,2)) - Initial trading amount
  - `bank_account_type` (VARCHAR(50)) - Type of bank account
  - `account_number` (VARCHAR(255)) - Bank account number

### **2. `trading_accounts` Table**
- **Purpose**: Stores trading account balances and statistics
- **Key Fields**:
  - `id` (VARCHAR(36)) - Unique account identifier
  - `user_id` (VARCHAR(36)) - Links to users table
  - `balance` (DECIMAL(15,2)) - Current account balance
  - `base_currency` (VARCHAR(10)) - Account currency
  - `total_profit` (DECIMAL(15,2)) - Total profit/loss
  - `today_profit` (DECIMAL(15,2)) - Today's profit/loss
  - `open_positions` (INT) - Number of open positions
  - `total_trades` (INT) - Total number of trades

### **3. `trades` Table**
- **Purpose**: Stores active trades
- **Key Fields**:
  - `id` (VARCHAR(36)) - Unique trade identifier
  - `user_id` (VARCHAR(36)) - Links to users table
  - `currency_pair` (VARCHAR(20)) - Trading pair (e.g., 'EUR/USD')
  - `trade_type` (ENUM) - 'buy' or 'sell'
  - `amount` (DECIMAL(15,2)) - Trade amount
  - `price` (DECIMAL(15,5)) - Execution price
  - `profit_loss` (DECIMAL(15,2)) - Profit/loss from trade

### **4. `trade_history` Table**
- **Purpose**: Stores completed trades for historical analysis
- **Same structure as `trades` table**

---

## 🔧 **Database Features**

### **Constraints & Relationships**
- ✅ Foreign key relationships between tables
- ✅ Unique constraints on email and user accounts
- ✅ ENUM types for data validation
- ✅ Decimal precision for financial data
- ✅ Automatic timestamps (created_at, updated_at)

### **Indexes for Performance**
- ✅ Index on user_id for fast lookups
- ✅ Index on created_at for time-based queries
- ✅ Index on email for authentication

### **Sample Data**
- ✅ Demo user account included
- ✅ Sample trading account setup

---

## 🚀 **Next Steps for Integration**

### **Option 1: Use with Backend API**
Create a backend API (Node.js, Python, etc.) that:
1. Connects to your MySQL database
2. Provides REST endpoints for:
   - User registration/login
   - Account management
   - Trade execution
   - Data retrieval

### **Option 2: Direct MySQL Integration**
If you want to connect directly from the frontend:
1. Install MySQL client library
2. Create database service layer
3. Handle authentication and data operations

### **Option 3: Use with Existing Backend**
If you have an existing backend:
1. Import the schema into your database
2. Update your API endpoints
3. Connect your frontend to the API

---

## 📊 **Sample Queries**

### **Check All Users**
```sql
SELECT * FROM users;
```

### **Check Trading Accounts**
```sql
SELECT * FROM trading_accounts;
```

### **Get User with Trading Account**
```sql
SELECT u.*, ta.* 
FROM users u 
JOIN trading_accounts ta ON u.id = ta.user_id;
```

### **Get Recent Trades**
```sql
SELECT * FROM trades 
ORDER BY created_at DESC 
LIMIT 10;
```

### **Get Trade Statistics**
```sql
SELECT 
    COUNT(*) as total_trades,
    SUM(profit_loss) as total_profit,
    AVG(profit_loss) as avg_profit
FROM trades;
```

---

## 🔍 **Verification Steps**

After running the schema:

1. **Check Tables Created**:
   ```sql
   SHOW TABLES;
   ```

2. **Verify Table Structure**:
   ```sql
   DESCRIBE users;
   DESCRIBE trading_accounts;
   DESCRIBE trades;
   DESCRIBE trade_history;
   ```

3. **Check Sample Data**:
   ```sql
   SELECT * FROM users;
   SELECT * FROM trading_accounts;
   ```

---

## 💡 **Current Application Status**

Your Alpha FX Trader application is now:
- ✅ **Supabase-free** - No cloud database dependencies
- ✅ **localStorage-based** - Data stored in browser
- ✅ **MySQL-ready** - Database schema prepared
- ✅ **Fully functional** - All features working with localStorage

**The application works perfectly with localStorage, and you can integrate MySQL whenever you're ready!** 🎉

---

## 🎯 **Files Created**

- `mysql-database-schema.sql` - Complete MySQL schema
- All Supabase files removed
- Application reverted to localStorage-only mode

Your application is now ready for MySQL integration when you decide to implement it!
