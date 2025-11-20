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

    function vote(uint256 _candidateID) public {
        require(!hasVoted[msg.sender], "Soz, you can only vote one time");
        require(_candidateID > 0 && _candidateID <= candidateCount);
        candidates[_candidateID].voteCount ++;
        hasVoted[msg.sender] = true;
    }

    function getWinner() public view returns (string memory winnerName, uint256 totalVotes, string memory winnerParty){
        require(candidateCount > 0,"You cannot vote for a candidate, if no one is a candidate");

        uint256 highestVotes;
        uint256 winingID;

        for (uint256 i = 1; i <= candidateCount; i++) 
        {
            if (candidates[i].voteCount > highestVotes){
                highestVotes = candidates[i].voteCount;
                winingID = i;
            }
        }
        winnerName = candidates[winingID].name;
        totalVotes = candidates[winingID].voteCount;
        winnerParty = candidates[winingID].party;
    }
}