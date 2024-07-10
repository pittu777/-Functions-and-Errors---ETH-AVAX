// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract VotingSystem {
    address public owner;
    uint public voterAge;
    mapping(address => bool) public hasVoted;
    mapping(uint => uint) public votes;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    function registerVoter(uint _age) public {
        voterAge = _age;
        hasVoted[msg.sender] = false;
        console.log("Voter registration complete. Age:", _age);
    }

    function vote(uint candidateId) public {
        require(voterAge >= 18, "You must be at least 18 years old to vote");
        require(!hasVoted[msg.sender], "You have already voted");
        votes[candidateId]++;
        hasVoted[msg.sender] = true;
        console.log("Vote cast for candidate:", candidateId);
    }

    function checkAssert() public view {
        assert(voterAge >= 18 && !hasVoted[msg.sender]);
        console.log("You are eligible to vote.");
    }

    function checkRequire() public view {
        require(voterAge >= 18, "You must be at least 18 years old to vote");
        require(!hasVoted[msg.sender], "You have already voted");
        console.log("You are eligible to vote.");
    }

    function checkRevert() public view {
        if (voterAge < 18) {
            revert("You must be at least 18 years old to vote");
        } else if (hasVoted[msg.sender]) {
            revert("You have already voted");
        } else {
            console.log("You are eligible to vote.");
        }
    }

    function getVotes(uint candidateId) public view returns (uint) {
        return votes[candidateId];
    }
}
