-- Real Estate 3NF Schema
-- Drop existing tables if they exist
DROP SCHEMA IF EXISTS raw CASCADE;
CREATE SCHEMA raw;

-- =============================================
-- REFERENCE / LOOKUP TABLES
-- =============================================

CREATE TABLE raw.neighborhoods (
    neighborhood_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(3) NOT NULL,
    zip_code VARCHAR(10) NOT NULL,
    median_income DECIMAL(12,2),
    walkability_score INTEGER CHECK (walkability_score BETWEEN 0 AND 100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE raw.property_types (
    property_type_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE raw.features (
    feature_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    category VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE raw.listing_statuses (
    status_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- CORE ENTITY TABLES
-- =============================================

CREATE TABLE raw.offices (
    office_id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    address VARCHAR(300) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(3) NOT NULL,
    zip_code VARCHAR(10) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100),
    founded_date DATE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE raw.agents (
    agent_id SERIAL PRIMARY KEY,
    office_id INTEGER NOT NULL REFERENCES raw.offices(office_id),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    license_number VARCHAR(50) UNIQUE NOT NULL,
    license_expiry DATE NOT NULL,
    hire_date DATE NOT NULL,
    commission_rate DECIMAL(5,4) DEFAULT 0.03,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE raw.customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(300),
    city VARCHAR(100),
    state VARCHAR(3),
    zip_code VARCHAR(10),
    customer_type VARCHAR(20) CHECK (customer_type IN ('buyer', 'seller', 'both')),
    preapproval_amount DECIMAL(14,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE raw.properties (
    property_id SERIAL PRIMARY KEY,
    neighborhood_id INTEGER NOT NULL REFERENCES raw.neighborhoods(neighborhood_id),
    property_type_id INTEGER NOT NULL REFERENCES raw.property_types(property_type_id),
    listing_agent_id INTEGER REFERENCES raw.agents(agent_id),
    status_id INTEGER NOT NULL REFERENCES raw.listing_statuses(status_id),
    address VARCHAR(300) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(3) NOT NULL,
    zip_code VARCHAR(10) NOT NULL,
    latitude DECIMAL(10,8),
    longitude DECIMAL(11,8),
    year_built INTEGER,
    square_feet INTEGER,
    lot_size_sqft INTEGER,
    bedrooms INTEGER,
    bathrooms DECIMAL(3,1),
    garage_spaces INTEGER DEFAULT 0,
    stories INTEGER DEFAULT 1,
    list_price DECIMAL(14,2) NOT NULL,
    hoa_monthly DECIMAL(10,2) DEFAULT 0,
    property_tax_annual DECIMAL(12,2),
    description TEXT,
    listing_date DATE NOT NULL,
    days_on_market INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- JUNCTION / TRANSACTION TABLES
-- =============================================

CREATE TABLE raw.property_features (
    property_feature_id SERIAL PRIMARY KEY,
    property_id INTEGER NOT NULL REFERENCES raw.properties(property_id),
    feature_id INTEGER NOT NULL REFERENCES raw.features(feature_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(property_id, feature_id)
);

CREATE TABLE raw.transactions (
    transaction_id SERIAL PRIMARY KEY,
    property_id INTEGER NOT NULL REFERENCES raw.properties(property_id),
    buyer_id INTEGER NOT NULL REFERENCES raw.customers(customer_id),
    seller_id INTEGER NOT NULL REFERENCES raw.customers(customer_id),
    buyer_agent_id INTEGER REFERENCES raw.agents(agent_id),
    seller_agent_id INTEGER REFERENCES raw.agents(agent_id),
    sale_price DECIMAL(14,2) NOT NULL,
    closing_date DATE NOT NULL,
    contract_date DATE NOT NULL,
    financing_type VARCHAR(50),
    earnest_money DECIMAL(12,2),
    closing_costs DECIMAL(12,2),
    is_cash_sale BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE raw.price_history (
    price_history_id SERIAL PRIMARY KEY,
    property_id INTEGER NOT NULL REFERENCES raw.properties(property_id),
    price DECIMAL(14,2) NOT NULL,
    change_date DATE NOT NULL,
    change_type VARCHAR(20) CHECK (change_type IN ('initial', 'increase', 'decrease')),
    change_reason TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- INDEXES FOR PERFORMANCE
-- =============================================

CREATE INDEX idx_properties_neighborhood ON raw.properties(neighborhood_id);
CREATE INDEX idx_properties_type ON raw.properties(property_type_id);
CREATE INDEX idx_properties_status ON raw.properties(status_id);
CREATE INDEX idx_properties_agent ON raw.properties(listing_agent_id);
CREATE INDEX idx_properties_price ON raw.properties(list_price);
CREATE INDEX idx_agents_office ON raw.agents(office_id);
CREATE INDEX idx_transactions_property ON raw.transactions(property_id);
CREATE INDEX idx_transactions_closing ON raw.transactions(closing_date);
CREATE INDEX idx_price_history_property ON raw.price_history(property_id);
