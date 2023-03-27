test_that("birthdays_per_month works as expected", {

  df <- data.frame(
    name = c("kevin", "stacey"),
    birthday = c(as.Date("2001-01-01"), as.Date("2002-01-02"))
  )
  birthdays <- birthdays(df)
  res <- birthdays_per_month(birthdays)

  expect_s3_class(res, "table")
  expect_named(res, "Jan")
})
