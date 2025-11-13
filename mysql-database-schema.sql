-- Alpha FX Trader MySQL Database Schema
-- Run this SQL code in MySQL Workbench

-- Create database
CREATE DATABASE IF NOT EXISTS alpha_fx_trader;
USE alpha_fx_trader;

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id VARCHAR(36) PRIMARY KEY,
    
    email VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    user_type ENUM('individual', 'organization') NOT NULL,
    organization_name VARCHAR(255) NULL,
    base_currency VARCHAR(10) NOT NULL,
    initial_amount DECIMAL(15,2) NOT NULL,
    bank_account_type VARCHAR(50) NOT NULL,
    account_number VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Trading accounts table
CREATE TABLE IF NOT EXISTS trading_accounts (
    id VARCHAR(36) PRIMARY KEY,
    user_id VARCHAR(36) NOT NULL,
    balance DECIMAL(15,2) NOT NULL DEFAULT 0,
    base_currency VARCHAR(10) NOT NULL,
    total_profit DECIMAL(15,2) NOT NULL DEFAULT 0,
    today_profit DECIMAL(15,2) NOT NULL DEFAULT 0,
    open_positions INT NOT NULL DEFAULT 0,
    total_trades INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE KEY unique_user_account (user_id)
);

-- Trades table (active trades)
CREATE TABLE IF NOT EXISTS trades (
    id VARCHAR(36) PRIMARY KEY,
    user_id VARCHAR(36) NOT NULL,
    currency_pair VARCHAR(20) NOT NULL,
    trade_type ENUM('buy', 'sell') NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    price DECIMAL(15,5) NOT NULL,
    profit_loss DECIMAL(15,2) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Trade history table (completed trades)
CREATE TABLE IF NOT EXISTS trade_history (
    id VARCHAR(36) PRIMARY KEY,
    user_id VARCHAR(36) NOT NULL,
    currency_pair VARCHAR(20) NOT NULL,
    trade_type ENUM('buy', 'sell') NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    price DECIMAL(15,5) NOT NULL,
    profit_loss DECIMAL(15,2) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Create indexes for better performance
CREATE INDEX idx_trading_accounts_user_id ON trading_accounts(user_id);
CREATE INDEX idx_trades_user_id ON trades(user_id);
CREATE INDEX idx_trades_created_at ON trades(created_at);
CREATE INDEX idx_trade_history_user_id ON trade_history(user_id);
CREATE INDEX idx_trade_history_created_at ON trade_history(created_at);
CREATE INDEX idx_users_email ON users(email);

-- Insert sample data (optional)
INSERT INTO users (id, email, name, user_type, base_currency, initial_amount, bank_account_type, account_number) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'demo@example.com', 'Demo User', 'individual', 'USD', 10000.00, 'savings', '1234567890');

INSERT INTO trading_accounts (id, user_id, balance, base_currency, total_profit, today_profit, open_positions, total_trades) VALUES
('550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440000', 10000.00, 'USD', 0.00, 0.00, 0, 0);

-- Show tables
SHOW TABLES;

-- Show table structures
DESCRIBE users;
DESCRIBE trading_accounts;
DESCRIBE trades;
DESCRIBE trade_history;
