#!/usr/bin/Rscript


CleanVotes <- function(votes) {
    CleanVote <- function(vote) {
        vote <- subset(vote, !is.na(vote))
        vote <- subset(vote, !duplicated(vote))
    }
    return(lapply(votes, CleanVote))

}

GetCurrentVotes <- function(votes) {
        ## Create factor levels for the candidates
        lvls <- unique(unlist(votes))
        ## Create Factor Vector with the current votes
        return(factor(sapply(votes, head, n = 1), levels = lvls))
}

GetApprovalVotes <- function(votes) as.factor(unlist(votes))

GetRankings <- function(cvotes) sort(table(cvotes), decreasing = TRUE)

NextVotes <- function(votes, losers) {
    NextVote <- function(vote) subset(vote, !(vote %in% losers))
    return(lapply(votes, NextVote))
}

HasWinner <- function(rankings) rankings[1] > sum(rankings) / 2

HasLoser <- function(rankings) rankings[1] > tail(rankings, 1)

GetLoser <- function(rankings) tail(names(rankings), 1)

BulkElimination <- function(rankings) {
    i <- 1
    n <- sum(rankings)
    while(i <= length(rankings)) {
        n <- n - rankings[i]
        if(rankings[i] > n) return(tail(names(rankings), -i))
        else i <- i + 1
    }
    return(character())
}

ApprovalElimination <- function(losers, votes) {
    rankingsA <- GetRankings(GetApprovalVotes(votes))
    rankingsA <- rankingsA[losers];
    ## browser()
    return(subset(names(rankingsA) , rankingsA == min(rankingsA)))
}

LogValues <- function(msg, values) {
    cat(msg, " :\n", paste(values, collapse = "\n"), "\n", sep = "")
}

CandidatesElimination <- function(rankings, votes) {
    ## losers <- character() ## FOR DEBUG
    losers <- BulkElimination(rankings)
    if(length(losers) == 0) {
        losers <- subset(names(rankings) , rankings == min(rankings))
        LogValues("ÉGALITÉ ENTRE PERDANTS", losers)
        losers <- ApprovalElimination(losers, votes)
        LogValues("ÉLIMINÉ PAR APPROBATION", losers)
        if(length(losers) > 1) {
            losers <- sample(losers, size = 1)
            LogValues("PAR TIRAGE AU SORT", losers)
        }
    } else {
        LogValues("ÉLIMINATION GROUPÉE DES PERDANTS", losers)
    }
    return(losers)
}


InstantRunoffVoting <- function(votes) {
    i <- 1
    votes <- CleanVotes(votes)
    repeat {
        cvotes <- GetCurrentVotes(votes)
        rankings <- GetRankings(cvotes)
        cat("\n\n### TOUR", i, "\nVOTES : \n")
        print(cvotes)
        cat("\nRANGS : \n")
        print(rankings)
        ## browser()
        if( HasWinner(rankings)) {
            winner <- names(rankings[1])
            LogValues("\nLE GAGNANT EST", winner)
            return(winner)
        } else if( HasLoser(rankings)) {
            losers <- CandidatesElimination(rankings, votes)
            ## browser()
            votes <- NextVotes(votes, losers)
        } else {
            LogValues("ÉGALITÉ ENTRE GAGNANTS", names(rankings))
            return(names(rankings));
        }
        i <- i + 1
    }
}


VotingSystemJFPC <- function(csvfile) {
    df <- read.csv(csvfile)
    votes <- unname(as.list(as.data.frame(apply(df[,3:5], 1, as.vector))))
    votes <- lapply(votes, substr, start = 1, stop = 3)
    InstantRunoffVoting(votes)
}
