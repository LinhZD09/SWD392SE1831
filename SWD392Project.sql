CREATE DATABASE SWD392Project;
USE SWD392Project;

CREATE TABLE Category (
    categoryId INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Procedures (
    procedureId INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    categoryId INT,
    createdDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    updateDate DATETIME,
    status VARCHAR(50),
    processingTime INT,
    fee DECIMAL(10,2),
    paymentRequired TEXT,
    submissionMethod VARCHAR(255),
    approvalAuthority VARCHAR(255),
    FOREIGN KEY (categoryId) REFERENCES Category(categoryId) ON DELETE SET NULL
);

CREATE TABLE News (
    newsId INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    createDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Users (
    userId INT PRIMARY KEY,
    fullName VARCHAR(255) NOT NULL,
    address TEXT,
    dob DATE,
    gender VARCHAR(10),
    role VARCHAR(50),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME
);

CREATE TABLE Staff (
    userId INT PRIMARY KEY,
    position VARCHAR(100),
    status VARCHAR(50),
    department VARCHAR(100),
    startDate DATE,
    endDate DATE,
    FOREIGN KEY (userId) REFERENCES Users(userId) ON DELETE CASCADE
);

CREATE TABLE Customer (
    userId INT PRIMARY KEY,
    membershipLevel VARCHAR(50),
    FOREIGN KEY (userId) REFERENCES Users(userId) ON DELETE CASCADE
);

CREATE TABLE AdministratorProcedure (
    adminProcedureId INT PRIMARY KEY,
    procedureCount INT,
    lastUpdated DATETIME
);

CREATE TABLE AdministratorSystem (
    userId INT PRIMARY KEY,
    totalUsers INT,
    bannedUsers INT,
    FOREIGN KEY (userId) REFERENCES Users(userId) ON DELETE CASCADE
);

CREATE TABLE Customer_News_View (
    customerId INT,
    newsId INT,
    PRIMARY KEY (customerId, newsId),
    FOREIGN KEY (customerId) REFERENCES Customer(userId) ON DELETE CASCADE,
    FOREIGN KEY (newsId) REFERENCES News(newsId) ON DELETE CASCADE
);

CREATE TABLE Customer_Procedure (
    userId INT,
    procedureId INT,
    PRIMARY KEY (userId, procedureId),
    FOREIGN KEY (userId) REFERENCES Customer(userId) ON DELETE CASCADE,
    FOREIGN KEY (procedureId) REFERENCES Procedures(procedureId) ON DELETE CASCADE
);

CREATE TABLE CustomerSearchHistory (
    searchHistoryId INT PRIMARY KEY,
    customerId INT,
    accountId INT,
    action VARCHAR(255),
    description TEXT,
    FOREIGN KEY (customerId) REFERENCES Customer(userId) ON DELETE CASCADE
);

CREATE TABLE Account (
    accountId INT PRIMARY KEY,
    userId INT UNIQUE,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phoneNumber VARCHAR(20),
    status VARCHAR(50),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME,
    FOREIGN KEY (userId) REFERENCES Users(userId) ON DELETE CASCADE
);

CREATE TABLE AdministratorInformation (
    userId INT PRIMARY KEY,
    totalArticles INT,
    lastModify DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userId) REFERENCES Staff(userId) ON DELETE CASCADE
);

CREATE TABLE InitiatePayment (
    paymentId INT PRIMARY KEY,
    customerId INT,
    procedureId INT,
    amount DECIMAL(10,2),
    status VARCHAR(50),
    transactionDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customerId) REFERENCES Customer(userId) ON DELETE CASCADE,
    FOREIGN KEY (procedureId) REFERENCES Procedures(procedureId) ON DELETE CASCADE
);

CREATE TABLE Files (
    fileId INT PRIMARY KEY,
    fileName VARCHAR(255),
    fileType VARCHAR(50),
    fileSize INT,
    uploadTime DATETIME DEFAULT CURRENT_TIMESTAMP,
    filePath VARCHAR(255),
    userId INT,
    FOREIGN KEY (userId) REFERENCES Users(userId) ON DELETE CASCADE
);

CREATE TABLE Comment (
    commentId INT PRIMARY KEY,
    customerId INT,
    createdDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    title VARCHAR(255),
    description TEXT,
    filedId INT,
    answeredBy INT,
    FOREIGN KEY (customerId) REFERENCES Customer(userId) ON DELETE CASCADE,
    FOREIGN KEY (filedId) REFERENCES Files(fileId) ON DELETE NO ACTION, 
    FOREIGN KEY (answeredBy) REFERENCES AdministratorInformation(userId) ON DELETE NO ACTION
);



CREATE TABLE ProceduresHistory (
    procedureHistoryId INT PRIMARY KEY,
    customerId INT,
    accountId INT,
    action VARCHAR(255),
    description TEXT,
    detail TEXT,
    dateAccept DATETIME,
    status VARCHAR(50),
    FOREIGN KEY (customerId) REFERENCES Customer(userId) ON DELETE CASCADE,
    FOREIGN KEY (accountId) REFERENCES Account(accountId) ON DELETE NO ACTION
);

CREATE TABLE ProcedureTemplate (
    templateId INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    data TEXT,
    description TEXT,
    status VARCHAR(50),
    adminId INT,
    FOREIGN KEY (adminId) REFERENCES AdministratorProcedure(adminProcedureId) ON DELETE CASCADE
);


CREATE TABLE Customer_Procedure_Template (
    customerId INT,
    templateId INT,
    PRIMARY KEY (customerId, templateId), 
    FOREIGN KEY (customerId) REFERENCES Customer(userId) ON DELETE CASCADE,
    FOREIGN KEY (templateId) REFERENCES ProcedureTemplate(templateId) ON DELETE CASCADE
);


CREATE TABLE ProcedureSubmission (
    submissionId INT PRIMARY KEY,
    customerId INT,
    templateId INT,
    title VARCHAR(255),
    description TEXT,
    submissionDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50),
    adminProcedureId INT,
    FOREIGN KEY (customerId) REFERENCES Customer(userId) ON DELETE CASCADE,
    FOREIGN KEY (adminProcedureId) REFERENCES AdministratorProcedure(adminProcedureId) ON DELETE CASCADE
);




CREATE TABLE BankingHistory (
    bankingHistoryId INT PRIMARY KEY,
    customerId INT,
    accountId INT,
    action VARCHAR(255),
    description TEXT,
    orderId VARCHAR(100),
    detail TEXT,
    amount DECIMAL(10,2),
    FOREIGN KEY (customerId) REFERENCES Customer(userId) ON DELETE CASCADE,
    FOREIGN KEY (accountId) REFERENCES Account(accountId) ON DELETE NO ACTION
);

CREATE TABLE Content (
    contentId INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    createdDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50),
    adminId INT,
    FOREIGN KEY (adminId) REFERENCES AdministratorInformation(userId) ON DELETE CASCADE
);

INSERT INTO Category (categoryId, name) VALUES
(1, 'Hành chính công'),
(2, 'Tài chính ngân hàng'),
(3, 'Giáo dục'),
(4, 'Y tế'),
(5, 'Giao thông');

INSERT INTO Procedures (procedureId, title, description, categoryId, status, processingTime, fee, paymentRequired, submissionMethod, approvalAuthority) VALUES
(1, 'Đăng ký giấy khai sinh', 'Thủ tục đăng ký giấy khai sinh cho trẻ em', 1, 'Active', 7, 0.00, 'Không', 'Trực tiếp', 'UBND Xã/Phường'),
(2, 'Gia hạn thẻ BHYT', 'Gia hạn bảo hiểm y tế cho người dân', 4, 'Active', 5, 300000.00, 'Có', 'Online', 'Bảo hiểm xã hội'),
(3, 'Cấp giấy phép lái xe', 'Thủ tục cấp giấy phép lái xe hạng B1', 5, 'Pending', 10, 135000.00, 'Có', 'Trực tiếp', 'Sở Giao thông vận tải');


INSERT INTO News (newsId, title, description) VALUES
(1, 'Cập nhật quy trình cấp CMND mới', 'Quy trình cấp CMND được cải tiến để nhanh chóng hơn.'),
(2, 'Gia hạn BHYT 2025', 'Thông tin quan trọng về gia hạn bảo hiểm y tế cho năm 2025.');


INSERT INTO Users (userId, fullName, address, dob, gender, role) VALUES
(1, 'Nguyen Dinh Linh', N'Hà Nội', '2003-06-19', 'Nam', 'Admin'),
(2, 'Tran Van Thao', N'TP.Hải Phòng', '2003-07-15', 'Nam', 'Customer'),
(3, 'Phạm Văn C', N'Đà Nẵng', '1988-09-30', 'Nam', 'Staff');


INSERT INTO Customer (userId, membershipLevel) VALUES
(2, 'VIP');

INSERT INTO Staff (userId, position, status, department, startDate) VALUES
(3, N'Nhân viên hành chính', 'Active', N'Hành chính công', '2015-03-01');

INSERT INTO Account (accountId, userId, username, password, email, phoneNumber, status) VALUES
(1, 1, 'adminA', 'password123', 'adminA@example.com', '0987654321', 'Active'),
(2, 2, 'customerB', 'password456', 'customerB@example.com', '0912345678', 'Active'),
(3, 3, 'staffC', 'password789', 'staffC@example.com', '0932123456', 'Active');

INSERT INTO AdministratorProcedure (adminProcedureId, procedureCount, lastUpdated) VALUES
(1, 10, '2025-01-01');

INSERT INTO InitiatePayment (paymentId, customerId, procedureId, amount, status) VALUES
(1, 2, 2, 300000, 'Paid');

INSERT INTO Files (fileId, fileName, fileType, fileSize, filePath, userId) VALUES
(1, 'CMND_scan.pdf', 'PDF', 200, '/uploads/CMND_scan.pdf', 2);

INSERT INTO AdministratorInformation (userId, totalArticles, lastModify) 
VALUES 
(3, 5, GETDATE());

INSERT INTO Comment (commentId, customerId, title, description, filedId, answeredBy) VALUES
(1, 2, N'Hỏi về CMND', N'Tôi muốn hỏi về quy trình cấp CMND mới', 1, 3);

INSERT INTO ProceduresHistory (procedureHistoryId, customerId, accountId, action, description, status) VALUES
(1, 2, 2, N'Nộp hồ sơ', N'Khách hàng đã nộp hồ sơ cấp CMND', N'Đang xử lý');

INSERT INTO ProcedureTemplate (templateId, title, description, status, adminId) VALUES
(1, N'Mẫu khai sinh', N'Mẫu giấy khai sinh dành cho trẻ em', 'Active', 1);


INSERT INTO ProcedureSubmission (submissionId, customerId, templateId, title, description, status, adminProcedureId) VALUES
(1, 2, 1, N'Nộp đơn khai sinh', N'Khách hàng nộp đơn khai sinh trực tuyến', 'Pending', 1);

INSERT INTO BankingHistory (bankingHistoryId, customerId, accountId, action, description, amount) VALUES
(1, 2, 2, N'Thanh toán phí BHYT', N'Khách hàng thanh toán phí bảo hiểm y tế', 300000);

INSERT INTO Content (contentId, title, description, status, adminId) VALUES
(1, N'Hướng dẫn làm CMND mới', N'Chi tiết các bước thực hiện cấp CMND mới', 'Published', 3);
