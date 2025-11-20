//SPDX-License-Identifier:MIT
pragma solidity ^0.8.30;

contract SLElection{
    struct Candidate{
        string name;
        string description;
        string party;
        uint256 voteCount;
    }
}