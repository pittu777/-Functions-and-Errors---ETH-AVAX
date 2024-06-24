# -Functions-and-Errors---ETH-AVAX

SchoolGradingSystem Smart Contract
The SchoolGradingSystem smart contract manages student information and grades on the Ethereum blockchain. It allows for adding, removing, and updating grades for students.

Features
Add Student: Add a new student with their name.
Set Grade: Set the grade for a student (owner-only).
Get Grade: Retrieve the grade of the student.
Remove Student: Remove a student (owner-only).
Requirements
Solidity ^0.8.0
Ethereum Development Environment (e.g., Remix, Truffle, Hardhat)
Getting Started
To deploy and interact with the SchoolGradingSystem contract:

Compile and Deploy:

Use Remix or your preferred Ethereum development environment to compile and deploy the contract.
Interact with the Contract:

Use Ethereum accounts to interact with the deployed contract:
Deployer account becomes the contract owner.
Other accounts can add students, set grades (owner only), get grades, and remove students (owner only).
Usage Examples
Deployment
Deploy the contract in your preferred Ethereum development environment.

Adding a Student

// Example of adding a student named Alice
schoolGradingSystem.addStudent("Alice");

Setting a Grade

// Example of setting a grade for a student
schoolGradingSystem.setGrade(studentAddress, 90);

Getting a Grade

// Example of getting the grade of a student
(string memory name, uint grade) = schoolGradingSystem.getGrade();

Removing a Student

// Example of removing a student
schoolGradingSystem.removeStudent();

Error Handling
The contract uses require, revert, and assert statements to handle errors such as invalid operations and student existence checks.
