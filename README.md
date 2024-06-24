

#SchoolGradingSystem Smart Contract

The SchoolGradingSystem smart contract manages student information and grades on the Ethereum blockchain. It provides functionalities to add students, set grades, retrieve grades, and remove students (owner-only).

Features

Add Student: Add a new student with their name.
Set Grade: Set the grade for a student (owner-only).
Get Grade: Retrieve the grade of the student.
Remove Student: Remove a student (owner-only).

Requirements

Solidity ^0.8.0: Ensure your Ethereum development environment supports Solidity version 0.8.0 or higher.
Ethereum Development Environment: Use Remix, Truffle, Hardhat, or any other suitable Ethereum development environment for compiling and deploying the contract.
Getting Started
To deploy and interact with the SchoolGradingSystem contract:

Compile and Deploy:

Use Remix or your preferred Ethereum development environment to compile and deploy the contract.
Ensure you have an Ethereum account set up to deploy the contract.
Interact with the Contract:

Once deployed, interact with the contract using Ethereum accounts:
The account that deploys the contract becomes the owner and can perform administrative actions.
Other accounts can add students, get grades, and (if the owner) set grades and remove students.
Usage Examples
Deployment
Deploy the contract in your preferred Ethereum development environment. Ensure you fund the deploying account with enough ETH for gas fees.

Adding a Student
To add a student, call the addStudent function with the student's name as a parameter:

solidity
// Example of adding a student named Alice
schoolGradingSystem.addStudent("Alice");
Setting a Grade
Only the contract owner can set grades for students. Use the setGrade function to assign a grade to a student's address:

solidity

// Example of setting a grade for a student
address studentAddress = 0x1234567890123456789012345678901234567890;
schoolGradingSystem.setGrade(studentAddress, 90);
Getting a Grade
Retrieve the grade of the student using the getGrade function. Ensure you call it from the student's address:

solidity

// Example of getting the grade of a student
(string memory name, uint grade) = schoolGradingSystem.getGrade();
Removing a Student
Only the contract owner can remove students from the system. Use removeStudent to delete a student's record:

solidity

// Example of removing a student
schoolGradingSystem.removeStudent();
Error Handling
The contract employs several error handling mechanisms:

Modifiers: onlyOwner, studentNotExists, and studentExistsOnly modifiers ensure that certain functions are only accessible by the contract owner or when specific conditions (like student existence) are met.

Require Statements: Used to validate inputs and conditions before executing functions, ensuring data integrity and preventing unauthorized actions.

Revert Statements: Used to revert transactions with custom error messages when conditions are not met, ensuring transactions are rolled back safely.

Assert Statements: Included to check for internal errors that should never occur, providing a failsafe mechanism to catch unexpected states.
