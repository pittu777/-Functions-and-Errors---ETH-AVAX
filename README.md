# VotingSystem Smart Contract
The VotingSystem smart contract allows users to register as voters, cast votes for candidates, and retrieve voting results securely on the blockchain.

## Features

- Voter Registration: Users can register as voters by providing their age.
- Voting: Registered voters can cast votes for their preferred candidates.
- Validation Methods: Three methods (checkAssert, checkRequire, checkRevert) demonstrate different ways to validate voter eligibility and prevent duplicate voting.
- Vote Tallying: Tracks votes for each candidate to determine election results.
## Usage

### Prerequisites
- Ensure you have an Ethereum development environment set up (e.g., Hardhat).
- Solidity compiler version 0.8.0 or higher.

## registerVoter Function
The registerVoter function registers a new voter on the blockchain by setting their age and initializing their voting status.

```solidity
function registerVoter(uint _age) public {
    voterAge = _age;
    hasVoted[msg.sender] = false;
    console.log("Voter registration complete. Age:", _age);
}
