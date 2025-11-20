//SPDX-License-Identifier:MIT
pragma solidity ^0.8.30;

contract SLElection{
    struct Candidate{
        string name;
        string description;
        string party;
        uint256 voteCount;
    }
    mapping(uint256 => Candidate) public candidates;
    mapping(address => bool) public hasVoted;
    uint256 public candidateCount;

    constructor(){
        candidateCount = 0; 
    }

    function addCondidate(string memory _name, string memory _party, string memory _description) public {
        candidateCount ++;
        candidates[candidateCount] = Candidate ({
            name: _name,
            description: _description,
            party: _party,
            voteCount: 0
        });
    }
}