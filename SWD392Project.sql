CREATE DATABASE SWD392Project;
USE SWD392Project;

CREATE TABLE Category (
    categoryId INT PRIMARY KEY,
    name NVARCHAR(255) NOT NULL
);

CREATE TABLE Procedures (
    procedureId INT PRIMARY KEY,
    title NVARCHAR(255) NOT NULL,
    description NVARCHAR(255),
    categoryId INT,
    createdDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    updateDate DATETIME,
    status VARCHAR(50),
    processingTime INT,
    fee DECIMAL(10,2),
    paymentRequired NVARCHAR(255),
    submissionMethod NVARCHAR(255),
    approvalAuthority NVARCHAR(255),
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
    title NVARCHAR(255),
    description NVARCHAR(500),
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
(1, N'Hành chính công'),
(2, N'Tài chính ngân hàng'),
(3, N'Giáo dục'),
(4, N'Y tế'),
(5, N'Giao thông'),
(6, N'Xây dựng'),
(7, N'Môi trường'),
(8, N'Nông nghiệp'),
(9, N'Văn hóa - Thể thao'),
(10, N'Công nghệ thông tin');

INSERT INTO Procedures (procedureId, title, description, categoryId, status, processingTime, fee, paymentRequired, submissionMethod, approvalAuthority) VALUES
(1, N'Đăng ký giấy khai sinh', N'Thủ tục đăng ký giấy khai sinh cho trẻ em', 1, 'Pending', 7, 0.00, N'Không', N'Trực tiếp', N'UBND Xã/Phường');
INSERT INTO Procedures (procedureId, title, description, categoryId, status, processingTime, fee, paymentRequired, submissionMethod, approvalAuthority) VALUES
(2, N'Gia hạn thẻ BHYT', N'Gia hạn bảo hiểm y tế cho người dân', 4, 'Pending', 5, 300000.00, N'Có', 'Online', N'Bảo hiểm xã hội');
INSERT INTO Procedures (procedureId, title, description, categoryId, status, processingTime, fee, paymentRequired, submissionMethod, approvalAuthority) VALUES
(3, N'Cấp giấy phép lái xe', N'Thủ tục cấp giấy phép lái xe hạng B1', 5, 'Pending', 10, 135000.00, N'Có', N'Trực tiếp', N'Sở Giao thông vận tải');
INSERT INTO Procedures (procedureId, title, description, categoryId, status, processingTime, fee, paymentRequired, submissionMethod, approvalAuthority) VALUES
(4, N'Cấp hộ chiếu', N'Thủ tục cấp hộ chiếu cho công dân Việt Nam', 1, 'Pending', 10, 200000.00, N'Có', N'Trực tiếp', N'Cục Xuất Nhập Cảnh');
INSERT INTO Procedures (procedureId, title, description, categoryId, status, processingTime, fee, paymentRequired, submissionMethod, approvalAuthority) VALUES
(5, N'Đăng ký kinh doanh', N'Đăng ký kinh doanh cho doanh nghiệp vừa và nhỏ', 6, 'Pending', 15, 500000.00, N'Có', 'Online', N'Sở Kế hoạch Đầu tư');
INSERT INTO Procedures (procedureId, title, description, categoryId, status, processingTime, fee, paymentRequired, submissionMethod, approvalAuthority) VALUES
(6, N'Cấp giấy chứng nhận quyền sử dụng đất', N'Thủ tục cấp sổ đỏ', 6, 'Pending', 20, 800000.00, N'Có', N'Trực tiếp', N'Sở Tài nguyên Môi trường');
INSERT INTO Procedures (procedureId, title, description, categoryId, status, processingTime, fee, paymentRequired, submissionMethod, approvalAuthority) VALUES
(7, N'Cấp giấy phép xây dựng', N'Thủ tục xin cấp phép xây dựng nhà ở', 6, 'Pending', 10, 300000.00, N'Có', 'Online', N'Sở Xây dựng');
INSERT INTO Procedures (procedureId, title, description, categoryId, status, processingTime, fee, paymentRequired, submissionMethod, approvalAuthority) VALUES
(8, N'Xin giấy phép môi trường', N'Thủ tục xin cấp phép xử lý môi trường', 7, 'Pending', 15, 100000.00, N'Có', 'Online', N'Sở Môi trường');
INSERT INTO Procedures (procedureId, title, description, categoryId, status, processingTime, fee, paymentRequired, submissionMethod, approvalAuthority) VALUES
(9, N'Đăng ký bảo hộ thương hiệu', N'Thủ tục bảo hộ nhãn hiệu, thương hiệu', 10, 'Pending', 30, 1000000.00, N'Có', N'Trực tiếp', N'Cục Sở hữu trí tuệ');
INSERT INTO Procedures (procedureId, title, description, categoryId, status, processingTime, fee, paymentRequired, submissionMethod, approvalAuthority) VALUES
(10, N'Xin visa du lịch', N'Thủ tục xin cấp visa đi du lịch nước ngoài', 1, 'Pending', 7, 500000.00, N'Có', 'Online', N'Đại sứ quán');



INSERT INTO News (newsId, title, description) VALUES
(1, N'Cập nhật quy trình cấp CMND mới', N'Quy trình cấp CMND được cải tiến để nhanh chóng hơn.'),
(2, N'Gia hạn BHYT 2025', N'Thông tin quan trọng về gia hạn bảo hiểm y tế cho năm 2025.'),
(3, N'Thay đổi luật thuế 2025', 'Những điều chỉnh mới trong luật thuế có hiệu lực từ 2025.'),
(4, N'Cấp phép xây dựng online', 'Cách xin giấy phép xây dựng trực tuyến nhanh chóng.'),
(5, N'Thông tin mới về sổ đỏ', 'Hướng dẫn chi tiết thủ tục cấp giấy chứng nhận quyền sử dụng đất.'),
(6, N'Triển khai BHXH điện tử', 'Người lao động có thể nộp BHXH qua cổng thông tin điện tử.'),
(7, N'Ứng dụng công nghệ vào giáo dục', 'Các công nghệ mới đang thay đổi nền giáo dục.'),
(8, N'Cập nhật chính sách môi trường', 'Các doanh nghiệp cần lưu ý về chính sách môi trường mới.'),
(9, N'Thủ tục nhập khẩu hàng hóa', 'Những quy định mới về nhập khẩu trong năm 2025.'),
(10, N'Hướng dẫn đăng ký thương hiệu', 'Các bước để đăng ký bảo hộ nhãn hiệu hiệu quả.');


INSERT INTO Users (userId, fullName, address, dob, gender, role) VALUES
(1, 'Admin', N'Hà Nội', '2003-06-19', 'Nam', 'Admin'),
(2, 'Customer', N'TP.Hải Phòng', '2003-07-15', 'Nam', 'Customer'),
(3, 'Information', N'Đà Nẵng', '1988-09-30', 'Nam', 'Information'),
(4, 'Procedure', N'Cần Thơ', '1988-09-30', 'Nam', 'Procedure');

INSERT INTO Customer (userId, membershipLevel) VALUES
(2, 'VIP');

INSERT INTO Staff (userId, position, status, department, startDate) VALUES
(3, N'Nhân viên hành chính', 'Active', N'Hành chính công', '2015-03-01');

INSERT INTO Account (accountId, userId, username, password, email, phoneNumber, status) VALUES
(1, 1, 'Admin', '1234', 'admin@example.com', '0987654321', 'Active'),
(2, 2, 'Customer', '1234', 'customerB@example.com', '0912345678', 'Active'),
(3, 3, 'Information', '1234', 'Information@example.com', '0932123456', 'Active'),
(4, 4, 'Procedure', '1234', 'Procedure@example.com', '0932123456', 'Active');

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


INSERT INTO BankingHistory (bankingHistoryId, customerId, accountId, action, description, amount) VALUES
(1, 2, 2, N'Thanh toán phí BHYT', N'Khách hàng thanh toán phí bảo hiểm y tế', 300000);

INSERT INTO Content (contentId, title, description, status, adminId) VALUES
(1, N'Hướng dẫn làm CMND mới', N'Chi tiết các bước thực hiện cấp CMND mới', 'Published', 3);

ALTER TABLE ProcedureTemplate
ALTER COLUMN data NVARCHAR(MAX);

DELETE FROM ProcedureTemplate;
-- Cập nhật dữ liệu JSON với hai template
UPDATE ProcedureTemplate
SET data = N'{
  "formTitle": "Đăng ký tạm trú",
  "fields": [
    { "label": "Họ và tên", "name": "fullName", "type": "text", "required": true},
    { "label": "Ngày sinh", "name": "dob", "type": "date", "required": true},
    { "label": "Địa chỉ tạm trú", "name": "temporaryAddress", "type": "text", "required": true}
  ]
}'
WHERE templateId = 1;

UPDATE ProcedureTemplate
SET data = N'{
  "formTitle": "Đăng ký hộ khẩu",
  "fields": [
    { "label": "Họ và tên", "name": "fullName", "type": "text", "required": true, "content": "Trần Thị B" },
    { "label": "Địa chỉ thường trú", "name": "permanentAddress", "type": "text", "required": true, "content": "456 Đường XYZ, Quận 3, TP.HCM" },
    { "label": "Số nhân khẩu", "name": "householdMembers", "type": "number", "required": true, "content": "4" }
  ]
}'
WHERE templateId = 2;


-- Thêm 5 submission với templateId chính xác
INSERT INTO ProcedureSubmission (submissionId, customerId, templateId, title, description, submissionDate, status, adminProcedureId) VALUES
(1, 2, 1, N'Đăng ký tạm trú tại Hà Nội', N'{
  "formTitle": "Đăng ký tạm trú",
  "fields": [
    { "label": "Họ và tên", "name": "fullName", "type": "text", "required": true, "content": "Nguyễn Văn A" },
    { "label": "Ngày sinh", "name": "dob", "type": "date", "required": true, "content": "2000-01-01" },
    { "label": "Địa chỉ tạm trú", "name": "temporaryAddress", "type": "text", "required": true, "content": "123 Đường ABC, Quận 1, TP.HCM" }
  ]
}', '2025-03-10 08:00:00', 'Pending', 1),
(2, 2, 2, N'Đăng ký hộ khẩu tại TP.HCM', N'{
  "formTitle": "Đăng ký hộ khẩu",
  "fields": [
    { "label": "Họ và tên", "name": "fullName", "type": "text", "required": true, "content": "Trần Thị B" },
    { "label": "Địa chỉ thường trú", "name": "permanentAddress", "type": "text", "required": true, "content": "456 Đường XYZ, Quận 3, TP.HCM" },
    { "label": "Số nhân khẩu", "name": "householdMembers", "type": "number", "required": true, "content": "4" }
  ]
}', '2025-03-11 09:00:00', 'Pending', 1),
(3, 2, 1, N'Đăng ký tạm trú Đà Nẵng', N'{
  "formTitle": "Đăng ký tạm trú",
  "fields": [
    { "label": "Họ và tên", "name": "fullName", "type": "text", "required": true, "content": "Nguyễn Văn B" },
    { "label": "Ngày sinh", "name": "dob", "type": "date", "required": true, "content": "2000-01-01" },
    { "label": "Địa chỉ tạm trú", "name": "temporaryAddress", "type": "text", "required": true, "content": "1234 Đường ABC, Quận 1, TP.HCM" }
  ]
}', '2025-03-12 10:00:00', 'Pending', 1),
(4, 2, 2, N'Đăng ký hộ khẩu Hải Phòng', N'{
  "formTitle": "Đăng ký hộ khẩu",
  "fields": [
    { "label": "Họ và tên", "name": "fullName", "type": "text", "required": true, "content": "Trần Thị B" },
    { "label": "Địa chỉ thường trú", "name": "permanentAddress", "type": "text", "required": true, "content": "4567 Đường XYZA, Quận 3, TP.HCM" },
    { "label": "Số nhân khẩu", "name": "householdMembers", "type": "number", "required": true, "content": "4" }
  ]
}', '2025-03-13 11:00:00', 'Pending', 1),
(5, 2, 1, N'Đăng ký tạm trú Cần Thơ', N'{
  "formTitle": "Đăng ký tạm trú",
  "fields": [
    { "label": "Họ và tên", "name": "fullName", "type": "text", "required": true, "content": "Nguyễn Văn C" },
    { "label": "Ngày sinh", "name": "dob", "type": "date", "required": true, "content": "2000-01-01" },
    { "label": "Địa chỉ tạm trú", "name": "temporaryAddress", "type": "text", "required": true, "content": "123 Đường ABC, Quận 1, TP.HCM" }
  ]
}', '2025-03-14 12:00:00', 'Pending', 1);

