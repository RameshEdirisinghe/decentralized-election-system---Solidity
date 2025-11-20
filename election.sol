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
}