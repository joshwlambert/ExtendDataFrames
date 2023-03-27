test_that("birthday_paradox works as expected", {

  df <- data.frame(
    name = c("kevin", "stacey"),
    birthday = c(as.Date("2001-01-01"), as.Date("2002-01-02"))
  )
  birthdays <- birthdays(df)
  res <- birthday_paradox(birthdays)

  expect_vector(res, ptype = numeric())
  expect_named(res, c("num_coincidence", "prob_coincindence"))
})

test_that("birthday_paradox is S3 generic and method", {

  #expect_true(utils::isS3stdGeneric(birthday_paradox))
  expect_true(utils::isS3method("birthday_paradox.birthdays"))
})
