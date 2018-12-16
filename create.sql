-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-12-05 19:28:12.194

-- tables
-- Table: BankAccounts
DROP TABLE IF EXISTS BankAccounts CASCADE;
DROP TABLE IF EXISTS Businesses CASCADE;
DROP TABLE IF EXISTS Comments CASCADE;
DROP TABLE IF EXISTS Friends CASCADE;
DROP TABLE IF EXISTS Individuals CASCADE;
DROP TABLE IF EXISTS Payments CASCADE;
DROP TABLE IF EXISTS Requests CASCADE;
DROP TABLE IF EXISTS Transactions CASCADE;
DROP TABLE IF EXISTS Transfers CASCADE;
DROP TABLE IF EXISTS Users CASCADE;
DROP TABLE IF EXISTS User_Accounts CASCADE;
DROP TABLE IF EXISTS User_Info CASCADE;

CREATE TABLE BankAccounts (
    account_number int  NOT NULL,
    balance float  NOT NULL,
    overage_percent float  NOT NULL,
    CONSTRAINT BankAccounts_pk PRIMARY KEY (account_number)
);

-- Table: Businesses
CREATE TABLE Businesses (
    u_id serial  NOT NULL,
    biz_name text  NOT NULL,
    CONSTRAINT Businesses_pk PRIMARY KEY (u_id)
);

-- Table: Comments
CREATE TABLE Comments (
    comment_id serial NOT NULL,
    transaction_id int  NOT NULL,
    text text  NOT NULL,
    CONSTRAINT Comments_pk PRIMARY KEY (comment_id)
);

-- Table: Friends
CREATE TABLE Friends (
    u_id1 serial  NOT NULL,
    u_id2 serial  NOT NULL,
    CONSTRAINT Friends_pk PRIMARY KEY (u_id1,u_id2)
);

-- Table: Individuals
CREATE TABLE Individuals (
    u_id int  NOT NULL,
    username text  NOT NULL,
    CONSTRAINT Individuals_pk PRIMARY KEY (u_id)
);

-- Table: Payments
CREATE TABLE Payments (
    transaction_id serial  NOT NULL,
    amount float  NOT NULL,
    CONSTRAINT Payments_pk PRIMARY KEY (transaction_id)
);

-- Table: Requests
CREATE TABLE Requests (
    transaction_id serial  NOT NULL,
    amount float  NOT NULL,
    approved boolean  NOT NULL,
    CONSTRAINT Requests_pk PRIMARY KEY (transaction_id)
);

-- Table: Transactions
CREATE TABLE Transactions (
    transaction_id serial  NOT NULL,
    u_id serial  NOT NULL,
    t_id serial  NOT NULL,
    timestamp timestamp  NOT NULL,
    CONSTRAINT transaction_id PRIMARY KEY (transaction_id)
);

-- Table: Transfers\
CREATE TABLE Transfers (
    u_id serial  NOT NULL,
    timestamp timestamp  NOT NULL,
    amount float  NOT NULL,
    CONSTRAINT Transfers_pk PRIMARY KEY (u_id,timestamp)
);

-- Table: User_Accounts
CREATE TABLE User_Accounts (
    u_id serial  NOT NULL,
    account_number int  NOT NULL,
    CONSTRAINT User_Accounts_pk PRIMARY KEY (u_id)
);

-- Table: User_Info
CREATE TABLE User_Info (
    username text  NOT NULL,
    fname text  NOT NULL,
    lname text  NOT NULL,
    email text  NOT NULL,
    CONSTRAINT User_Info_pk PRIMARY KEY (username)
);

-- Table: Users

CREATE TABLE Users (
    u_id serial  NOT NULL,
    venmo_balance float  NOT NULL,
    CONSTRAINT Users_pk PRIMARY KEY (u_id)
);

-- foreign keys
-- Reference: Businesses_Users (table: Businesses)
ALTER TABLE Businesses ADD CONSTRAINT Businesses_Users
    FOREIGN KEY (u_id)
    REFERENCES Users (u_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Friends_Uid1 (table: Friends)
--ALTER TABLE Friends ADD CONSTRAINT Friends_Uid1
   -- FOREIGN KEY (u_id1)
   -- REFERENCES Users (u_id)  
 --   NOT DEFERRABLE 
--    INITIALLY IMMEDIATE
--;

-- Reference: Friends_Uid2 (table: Friends)
ALTER TABLE Friends ADD CONSTRAINT Friends_Uid2
    FOREIGN KEY (u_id2)
    REFERENCES Users (u_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: IDTable_Users (table: Individuals)
ALTER TABLE Individuals ADD CONSTRAINT IDTable_Users
    FOREIGN KEY (u_id)
    REFERENCES Users (u_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Requests_Transactions (table: Requests)
ALTER TABLE Requests ADD CONSTRAINT Requests_Transactions
    FOREIGN KEY (transaction_id)
    REFERENCES Transactions (transaction_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Transaction_Comments1 (table: Comments)
ALTER TABLE Comments ADD CONSTRAINT Transaction_Comments1
    FOREIGN KEY (transaction_id)
    REFERENCES Transactions (transaction_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Transaction_Payments2 (table: Payments)
ALTER TABLE Payments ADD CONSTRAINT Transaction_Payments2
    FOREIGN KEY (transaction_id)
    REFERENCES Transactions (transaction_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Transactions_Uid (table: Transactions)
ALTER TABLE Transactions ADD CONSTRAINT Transactions_Uid
    FOREIGN KEY (u_id)
    REFERENCES Individuals (u_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Transactions_Uid2 (table: Transactions)
ALTER TABLE Transactions ADD CONSTRAINT Transactions_Uid2
    FOREIGN KEY (t_id)
    REFERENCES Individuals (u_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Transfer_Uid (table: Transfers)
ALTER TABLE Transfers ADD CONSTRAINT Transfer_Uid
    FOREIGN KEY (u_id)
    REFERENCES Users (u_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: User_Accounts_Transfers (table: Transfers)
ALTER TABLE Transfers ADD CONSTRAINT User_Accounts_Transfers
    FOREIGN KEY (u_id)
    REFERENCES User_Accounts (u_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: User_Info_IDTable (table: Individuals)
ALTER TABLE Individuals ADD CONSTRAINT User_Info_IDTable
    FOREIGN KEY (username)
    REFERENCES User_Info (username) ON UPDATE CASCADE
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: User_Nums (table: User_Accounts)
ALTER TABLE User_Accounts ADD CONSTRAINT User_Nums
    FOREIGN KEY (account_number)
    REFERENCES BankAccounts (account_number)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

