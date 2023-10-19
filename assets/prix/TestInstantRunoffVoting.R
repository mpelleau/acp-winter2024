library(testthat)

source('InstantRunoffVoting.R')

## test_file('TestInstantRunoffVoting.R')

## Scenario 1
votes1 <- list(
    c("a", "b", "c", "d"),
    c("d", "b", "a", "c"),
    c("c", "b", "d", "a"),
    c("b", "e")
)
votes1 <- append(votes1, votes1)

## Scenario 2
votes2 <- list(
    c("a", "b", "c", "d", "a"),
    c("d", "b", "a", "c", "b"),
    c("c", "b", "d", "a", "d"),
    c("a", "e", "c")
)
votes2 <- append(votes2, votes2)

## Scenario 3
votes3 <- list(
    c("a", "b", "c", "d", "a"),
    c("d", "b", "a", "c", "b"),
    c("c", "b", "d", "a", "d"),
    c("a", "e")
)
votes3 <- append(votes3, votes3)



test_that("Cleaning votes", {
    votes <- list(
        c("a", "b", NA, "b", "a", "a"),
        c(NA, NA, "d", "d", "d", "a", "a"),
        c(NA, "c", NA, "b", NA, "b", NA, "d")
    )
    votes <- CleanVotes(votes)
    expect_equal(votes[[1]], c("a", "b"))
    expect_equal(votes[[2]], c("d", "a"))
    expect_equal(votes[[3]], c("c", "b", "d"))
})

test_that("Counting Votes", {
    cvotes <- GetCurrentVotes(votes1)
    expect_equal(as.vector(GetRankings(cvotes)), c(2, 2, 2, 2, 0))

    cvotes <- GetApprovalVotes(votes1)
    expect_equal(as.vector(GetRankings(cvotes)), c(8, 6, 6, 6, 2))

})


test_that("Removing Votes", {
    votes <- NextVotes(votes1, "e")
    votes <- NextVotes(votes, c("a", "b"))

    cvotes <- GetCurrentVotes(votes)
    expect_equal(as.vector(GetRankings(cvotes)), c(4, 2))

    cvotes <- GetApprovalVotes(votes)
    expect_equal(as.vector(GetRankings(cvotes)), c(6, 6))

})

test_that("Bulk Elimination", {
    expect_equal(BulkElimination(c(a = 12, b = 11)), c("b"))
    expect_equal(BulkElimination(c(a = 12, b = 12)), character())

    expect_equal(BulkElimination(c(a = 22, b = 11, c = 10)), c("b", "c"))
    expect_equal(BulkElimination(c(a = 22, b = 11, c = 11)), character())
})

test_that("Approval Elimination", {
    expect_equal(ApprovalElimination(c("a", "b", "c"), votes1), c("a", "c"))
    expect_equal(ApprovalElimination(c("a", "d", "c"), votes1), c("a", "d", "c"))
    expect_equal(ApprovalElimination(c("a", "e", "c"), votes1), c("e"))
})


test_that("Test Voting System", {
    expect_equal(InstantRunoffVoting(votes1), c("a", "b", "c", "d"))
    expect_equal( InstantRunoffVoting(votes2), c("a"))

    results <- InstantRunoffVoting(votes3)
    expect_true(identical(results, "a") ||  identical(results, c("a", "d")))

})
