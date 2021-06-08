

contract Controller{
    
    storage
    voting
    government
    
    registerVoter( x = details you want for a voter inside a struct ) {
        storage.addVoter(msg.sender, x)
    }
    
    registerCandidate( x = details you want for a candidate inside a struct ) {
        storage.addCandidate(msg.sender, x)
    }
    
    changeGovernmentAddress( newGov){
        government = newGov;
    }
    
    getVoterDetails()
    getCandidateDetails();
    
    
    startVoting()
    endVoting()
    voteForCandidate();
    
    getVoteingStatus();
    getVotes();
    getWinner();
    getCandidates();
    
}