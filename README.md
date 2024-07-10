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

Increments the vote count for the specified candidateId.
Updates the voting status for the sender.
Logs the successful casting of the vote.

```solidity
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
```
### checkAssert()

``` solidity
function checkAssert() public view {
        assert(voterAge >= 18 && !hasVoted[msg.sender]);
        console.log("You are eligible to vote.");
    }
```

Checks voter eligibility using assert.

#### Requirements:
- Voter must be at least 18 years old.
- Voter must not have already voted.

#### Functionality:

- Asserts voter eligibility conditions.
- Logs eligibility status.

### checkRequire()

```solidity
function checkRequire() public view {
        require(voterAge >= 18, "You must be at least 18 years old to vote");
        require(!hasVoted[msg.sender], "You have already voted");
        console.log("You are eligible to vote.");
    }
```

Checks voter eligibility using require.

#### Requirements:
- Voter must be at least 18 years old.
- Voter must not have already voted.
#### Functionality:
- Requires voter eligibility conditions.
- Logs eligibility status.

### checkRevert()

``` solidity
function checkRevert() public view {
        if (voterAge < 18) {
            revert("You must be at least 18 years old to vote");
        } else if (hasVoted[msg.sender]) {
            revert("You have already voted");
        } else {
            console.log("You are eligible to vote.");
        }
    }
```
Checks voter eligibility using conditional revert.

#### Requirements:
- Voter must be at least 18 years old.
- Voter must not have already voted.
#### Functionality:
- Reverts transaction with specific error messages if conditions are not met.
- Logs eligibility status or revert reason.

### getVotes(uint candidateId)

```solidity
function getVotes(uint candidateId) public view returns (uint) {
        return votes[candidateId];
    }
```

- Retrieves the number of votes cast for a specific candidate.

#### Parameters:
- candidateId: Identifier of the candidate to retrieve votes for.
- Returns: Number of votes cast for the specified candidate.


### Authors
PITTU PRASANTH - @pittu777


