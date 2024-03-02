
-- -----------------------------------------------------
-- Schema chemdoor
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS Chemdoor;
USE Chemdoor;

START TRANSACTION;

-- -----------------------------------------------------
-- Table `chemdoor`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chemdoor`.`Employees` (
  `EmployeeID` INT NOT NULL AUTO_INCREMENT,
  `EmployeeFirstName` VARCHAR(20) ,
  `EmployeeLastName` VARCHAR(20) ,
  `EmployeePhoneNumber` VARCHAR(15) ,
  `EmployeeBirthDate` DATE ,
  `EmployeePhoto` MEDIUMBLOB ,
  `EmployeesNotes` VARCHAR(200) ,
  PRIMARY KEY (`EmployeeID`)
  );
  
-- -----------------------------------------------------
-- Table `chemdoor`.`CustomerScale`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `chemdoor`.`CustomerScale` (
  `CustomerScaleType` TINYINT(1) AUTO_INCREMENT,
  `EmployeesNumber` VARCHAR(45) ,
  `Description` VARCHAR(150) ,
  PRIMARY KEY (`CustomerScaleType`));

-- -----------------------------------------------------
-- Table `chemdoor`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chemdoor`.`Customers` (
  `CustomerTableEntryID` INT AUTO_INCREMENT,
  `CustomerCode` INT ,
  `CustomerName` VARCHAR(100) ,
  `ContactPerson` VARCHAR(45) ,
  `ContactPhone` VARCHAR(15) ,
  `Address` VARCHAR(100) ,
  `City` VARCHAR(45) ,
  `Effective` TINYINT NOT NULL DEFAULT 1,
  `EffectiveDate` DATE ,
  `ExpirationDate` DATE ,
  `CustomerScaleID` TINYINT(1) ,
  PRIMARY KEY (`CustomerTableEntryID`),
	FOREIGN KEY (`CustomerScaleID`) REFERENCES `chemdoor`.`CustomerScale` (`CustomerScaleType`));

-- -----------------------------------------------------
-- Table `chemdoor`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chemdoor`.`Orders` (
  `OrderID` INT AUTO_INCREMENT,
  `EmployeeID` INT ,
  `CustomerTableEntryID` INT ,
  `OrderDate` DATE ,
  `CompletedDate` DATE ,
  PRIMARY KEY (`OrderID`),
    FOREIGN KEY (`EmployeeID`) REFERENCES `chemdoor`.`Employees` (`EmployeeID`),
    FOREIGN KEY (`CustomerTableEntryID`) REFERENCES `chemdoor`.`Customers` (`CustomerTableEntryID`));

-- -----------------------------------------------------
-- Table `chemdoor`.`TemperatureConditions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chemdoor`.`TemperatureConditions` (
  `TemperatureConditionsID` TINYINT(1) AUTO_INCREMENT,
  `IDDescription` VARCHAR(250) NULL,
  PRIMARY KEY (`TemperatureConditionsID`));

-- -----------------------------------------------------
-- Table `chemdoor`.`Shippers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chemdoor`.`Shippers` (
  `ShipperID` INT AUTO_INCREMENT,
  `ShipperName` VARCHAR(45) ,
  `ContactPerson` VARCHAR(45) ,
  `ContactPhone` VARCHAR(15) ,
  `Address` VARCHAR(100) ,
  `City` VARCHAR(45) ,
  `TemperatureConditionsID` TINYINT(1),
  PRIMARY KEY (`ShipperID`),
    FOREIGN KEY (`TemperatureConditionsID`) REFERENCES `chemdoor`.`TemperatureConditions` (`TemperatureConditionsID`)
 );

-- -----------------------------------------------------
-- Table `chemdoor`.`Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chemdoor`.`Categories` (
  `CategoryID` INT AUTO_INCREMENT,
  `CategoryName` VARCHAR(45) ,
  `CategoryDescription` VARCHAR(450) ,
  PRIMARY KEY (`CategoryID`));

-- -----------------------------------------------------
-- Table `chemdoor`.`Suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chemdoor`.`Suppliers` (
  `SupplierID` INT AUTO_INCREMENT,
  `SupplierName` VARCHAR(100) ,
  `ContactPerson` VARCHAR(45) ,
  `ContactPhone` VARCHAR(15) ,
  `Address` VARCHAR(100) ,
  `City` VARCHAR(45) ,
  PRIMARY KEY (`SupplierID`));


-- -----------------------------------------------------
-- Table `chemdoor`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chemdoor`.`Products` (
  `ProductID` INT AUTO_INCREMENT,
  `SupplierID` INT,
  `ProductName` VARCHAR(100) ,
  `ProductDescription` VARCHAR(250) ,
  `CategoryID` INT ,
  `SupplierPrice` DECIMAL(6,2) ,
  `SellingPrice` DECIMAL(6,2) ,
  `UnitType` VARCHAR(100) ,
  `TemperatureConditionsID` TINYINT(1) ,
  PRIMARY KEY (`ProductID`, `SupplierID`),
    FOREIGN KEY (`CategoryID`) REFERENCES `chemdoor`.`Categories` (`CategoryID`),
    FOREIGN KEY (`SupplierID`) REFERENCES `chemdoor`.`Suppliers` (`SupplierID`),
    FOREIGN KEY (`TemperatureConditionsID`) REFERENCES `chemdoor`.`TemperatureConditions` (`TemperatureConditionsID`));

-- -----------------------------------------------------
-- Table `chemdoor`.`OrderDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chemdoor`.`OrderDetails` (
  `OrderDetailsID` INT AUTO_INCREMENT,
  `OrderID` INT ,
  `ProductID` INT ,
  `ShipperID` INT ,
  `Quantity` INT ,
  PRIMARY KEY (`OrderDetailsID`),
    FOREIGN KEY (`OrderID`) REFERENCES `chemdoor`.`Orders` (`OrderID`),
    FOREIGN KEY (`ProductID`) REFERENCES `chemdoor`.`Products` (`ProductID`),
    FOREIGN KEY (`ShipperID`) REFERENCES `chemdoor`.`Shippers` (`ShipperID`));
    
    COMMIT;