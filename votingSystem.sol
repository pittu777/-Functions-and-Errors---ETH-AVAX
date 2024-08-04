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
        assert(grade >= MIN_GRADE && grade <= MAX_GRADE); 
        return grade;
    }

    function deleteStudent(address student) public onlyAdmin {
        require(grades[student] != 0, "Student does not exist");
        delete grades[student];
    }
}
