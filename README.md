# SchoolGrades Smart Contract
This Solidity program is a simple smart contract for managing student grades in a school system. It demonstrates basic functionality such as adding, updating, retrieving, and deleting student grades.

## Description

The SchoolGrades contract is designed to manage grades for students in a school. It allows an administrator to:

- Add a new student's grade.
- Update an existing student's grade.
- Retrieve a student's grade.
- Delete a student's record.
  
The contract ensures that grades are within a valid range (0 to 100) and uses error handling to manage exceptions effectively.

## Getting Started
To interact with this smart contract, you can use the Remix IDE, an online tool for Solidity development.

#### Executing the Contract
- Open Remix IDE:
- Go to Remix Ethereum IDE.

- Create a New File:
Click on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., SchoolGrades.sol).

## Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SchoolGrades {
    mapping(address => uint8) private grades;
    address public admin;
    uint8 public constant MIN_GRADE = 0;
    uint8 public constant MAX_GRADE = 100;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    function addStudent(address student, uint8 grade) public onlyAdmin {
        require(grade >= MIN_GRADE && grade <= MAX_GRADE, "Invalid grade");
        grades[student] = grade;
    }

    function updateGrade(address student, uint8 newGrade) public onlyAdmin {
        require(grades[student] != 0, "Student does not exist");
        require(newGrade >= MIN_GRADE && newGrade <= MAX_GRADE, "Invalid grade");
        grades[student] = newGrade;
    }

    function getGrade(address student) public view returns (uint8) {
        uint8 grade = grades[student];
        assert(grade >= MIN_GRADE && grade <= MAX_GRADE); // Ensure the grade is in the valid range
        return grade;
    }

    function deleteStudent(address student) public onlyAdmin {
        require(grades[student] != 0, "Student does not exist");
        delete grades[student];
    }
}

```

## Compile the Code:

Click on the "Solidity Compiler" tab in the left-hand sidebar. Set the compiler version to 0.8.0 or another compatible version, and then click "Compile SchoolGrades.sol".

## Deploy the Contract:
Go to the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the SchoolGrades contract from the dropdown menu and click "Deploy".

## Interact with the Contract:
After deployment, you can interact with the contract. Use the functions provided:

addStudent: Add a new student with a grade.
updateGrade: Update an existing student's grade.
getGrade: Retrieve a student's grade.
deleteStudent: Delete a student's record.

### Authors
PITTU PRASANTH - @pittu777


