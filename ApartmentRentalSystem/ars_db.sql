/*
MySQL Data Transfer
Source Host: localhost
Source Database: ars_db
Target Host: localhost
Target Database: ars_db
Date: 12/9/2015 10:50:58 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for allotment
-- ----------------------------
CREATE TABLE `allotment` (
  `Registration_Code` varchar(255) default NULL,
  `User_ID` int(11) default NULL,
  `Lease_ID` int(11) default NULL,
  `Allotment_Date` date default NULL,
  `Allotment_ID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`Allotment_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for apartment
-- ----------------------------
CREATE TABLE `apartment` (
  `Apartment_ID` int(11) NOT NULL auto_increment,
  `Apartment_Number` varchar(20) default NULL,
  `Apartment_Type` varchar(20) default NULL,
  `Apartment_Rent` int(11) default NULL,
  `Apartment_Status` varchar(20) default NULL,
  `Apartment_water_charges` int(11) default NULL,
  `Apartment_sewage_charges` int(11) default NULL,
  `Apartment_garbage_charges` int(11) default NULL,
  PRIMARY KEY  (`Apartment_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for lease
-- ----------------------------
CREATE TABLE `lease` (
  `Lease_ID` int(11) NOT NULL auto_increment,
  `Lease_Start_Date` date default NULL,
  `Lease_End_Date` date default NULL,
  `Apartment_ID` int(11) default NULL,
  PRIMARY KEY  (`Lease_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for payment
-- ----------------------------
CREATE TABLE `payment` (
  `Payment_ID` int(11) NOT NULL auto_increment,
  `Payment_Type` varchar(30) default NULL,
  `Account_Details` varchar(15) default NULL,
  `Payment_Duration_FromDate` date default NULL,
  `Payment_Duration_ToDate` date default NULL,
  `Payment_Amount` int(11) default NULL,
  `Payment_by` int(11) default NULL,
  `Payment_Date` date default NULL,
  PRIMARY KEY  (`Payment_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for renewal
-- ----------------------------
CREATE TABLE `renewal` (
  `Renewal_ID` int(11) NOT NULL auto_increment,
  `Renewal_Start_Date` date default NULL,
  `Renewal_End_Date` date default NULL,
  `Renewal_Status` varchar(255) default NULL,
  `Renewal_Request_Date` date default NULL,
  `Requested_by` int(11) default NULL,
  `Apartment_Number` varchar(30) default NULL,
  PRIMARY KEY  (`Renewal_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for termination
-- ----------------------------
CREATE TABLE `termination` (
  `Termination_ID` int(11) NOT NULL auto_increment,
  `Termination_Leaving_Date` date default NULL,
  `Termination_Request_Date` date default NULL,
  `Termination_Status` varchar(30) default NULL,
  `Requested_by` int(11) default NULL,
  `Apartment_Number` varchar(30) default NULL,
  PRIMARY KEY  (`Termination_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
CREATE TABLE `user_info` (
  `First_Name` varchar(30) default NULL,
  `Last_Name` varchar(30) default NULL,
  `Login` varchar(50) default NULL,
  `Password` varchar(30) default NULL,
  `Email` varchar(30) NOT NULL,
  `Registration_Date` date default NULL,
  `USER_TYPE` int(11) default '0',
  `User_ID` int(11) NOT NULL auto_increment,
  `Coresident` varchar(30) default NULL,
  `Mobile` varchar(255) default NULL,
  PRIMARY KEY  (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `allotment` VALUES ('12345', '8', '15', '2015-12-09', '11');
INSERT INTO `allotment` VALUES ('54321', '9', '16', '2015-12-09', '12');
INSERT INTO `allotment` VALUES ('23456', '11', '17', '2015-12-09', '13');
INSERT INTO `allotment` VALUES ('55555', '13', '18', '2015-12-09', '14');
INSERT INTO `allotment` VALUES ('33333', '14', '19', '2015-12-09', '15');
INSERT INTO `allotment` VALUES ('66777', '16', '20', '2015-12-09', '16');
INSERT INTO `allotment` VALUES ('44555', '19', '21', '2015-12-09', '17');
INSERT INTO `allotment` VALUES ('KH123', '20', '22', '2015-12-09', '18');
INSERT INTO `allotment` VALUES ('FR324', '22', '23', '2015-12-09', '19');
INSERT INTO `apartment` VALUES ('16', '104', 'Flat', '5300', null, null, null, null);
INSERT INTO `apartment` VALUES ('17', '448', 'House', '14000', 'VACANT', null, null, null);
INSERT INTO `apartment` VALUES ('18', '34', 'House', '500', 'ALLOTED', '300', '400', '500');
INSERT INTO `lease` VALUES ('15', '2015-07-01', '2015-12-31', '16');
INSERT INTO `lease` VALUES ('16', '2015-01-01', '2015-12-31', '17');
INSERT INTO `lease` VALUES ('17', '2014-01-21', '2015-09-21', '17');
INSERT INTO `lease` VALUES ('18', '2014-08-21', '2015-09-21', '17');
INSERT INTO `lease` VALUES ('19', '2014-01-21', '2014-03-05', '17');
INSERT INTO `lease` VALUES ('20', '2014-01-21', '2015-02-23', '17');
INSERT INTO `lease` VALUES ('21', '2014-01-21', '2015-01-21', '17');
INSERT INTO `lease` VALUES ('22', '2014-01-01', '2015-12-31', '18');
INSERT INTO `lease` VALUES ('23', '2013-02-01', '2013-02-28', '18');
INSERT INTO `payment` VALUES ('3', 'Monthly rent', 'Current Account', '2015-08-01', '2015-08-30', '14000', '9', '2015-12-09');
INSERT INTO `payment` VALUES ('4', 'Monthly Rent', 'Current Account', '2015-01-01', '2015-01-31', '3400', '22', '2015-12-09');
INSERT INTO `renewal` VALUES ('4', '2016-01-01', '2016-12-31', 'Approved', '2015-12-09', '9', null);
INSERT INTO `renewal` VALUES ('5', '2015-01-01', '2016-12-31', 'Rejected', '2015-12-09', '9', '448');
INSERT INTO `renewal` VALUES ('6', '2014-01-01', '2015-12-31', 'Pending', '2015-12-09', '22', '34');
INSERT INTO `termination` VALUES ('2', '2015-11-30', '2015-12-09', 'Approved', '9', null);
INSERT INTO `termination` VALUES ('3', '2016-01-01', '2015-12-09', 'Approved', '8', null);
INSERT INTO `termination` VALUES ('4', '2016-05-05', '2015-12-09', 'Approved', '9', '448');
INSERT INTO `termination` VALUES ('5', '2015-02-21', '2015-12-09', 'Approved', '20', '34');
INSERT INTO `termination` VALUES ('6', '2015-12-31', '2015-12-09', 'Rejected', '22', '34');
INSERT INTO `user_info` VALUES ('Rental', 'System', 'Admin', 'admin', 'admin@rentalsystem.com', '2015-12-02', '1', '2', null, null);
INSERT INTO `user_info` VALUES ('Irshad', 'Faiz', 'irshad_faiz', 'password', 'irshad_faiz@yahoo.com', null, '0', '8', 'Abbu', '0333-3219629');
INSERT INTO `user_info` VALUES ('Imran', 'Khan', 'imran_faiz', 'password', 'imran_faiz@yahoo.com', null, '0', '9', 'Ammi', '0345-3044995');
INSERT INTO `user_info` VALUES ('Kashif', 'Khan', null, null, 'kashif@abc.com', null, '0', '11', null, null);
INSERT INTO `user_info` VALUES ('Javed', 'Khan', null, null, 'javed@gmail.com', null, '0', '13', null, null);
INSERT INTO `user_info` VALUES ('c1', 'c2', null, null, 'dsf', null, '0', '14', null, null);
INSERT INTO `user_info` VALUES ('hamid', 'khan', null, null, 'gmail', null, '0', '16', null, null);
INSERT INTO `user_info` VALUES ('allah', 'ditta', null, null, 'new@gmail.com', null, '0', '19', null, null);
INSERT INTO `user_info` VALUES ('Khalid', 'Hafeez', 'khalid', 'khalid', 'khalid@dhoti.com', null, '0', '20', 'Aban', '9876987');
INSERT INTO `user_info` VALUES ('Farhan', 'Hassan', 'farhan', 'farhan', 'farhan@live.com', null, '0', '22', 'musa', '87342342');
