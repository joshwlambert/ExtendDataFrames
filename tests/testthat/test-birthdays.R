test_that("birthdays constructors works as expected", {
  df <- data.frame(
     name = c("kevin", "stacey"),
     birthday = c(as.Date("2001-01-01"), as.Date("2002-01-02"))
   )
   birthdays <- birthdays(df)

   expect_s3_class(birthdays, "birthdays")
   expect_s3_class(birthdays, "data.frame")
})

test_that("birthdays constructors fails as expected", {
  df <- data.frame(
    name = c("kevin", "stacey")
  )
 expect_error(
   birthdays(df),
   regexp = "input must contain 'name' and 'birthday' columns"
 )

 df <- data.frame(
   birthday = c(as.Date("2001-01-01"), as.Date("2002-01-02"))
 )
 expect_error(
   birthdays(df),
   regexp = "input must contain 'name' and 'birthday' columns"
 )
})

test_that("birthdays validator works as expected", {
  df <- data.frame(
    name = c("kevin", "stacey"),
    birthday = c(as.Date("2001-01-01"), as.Date("2002-01-02"))
  )
  birthdays <- birthdays(df)

  expect_silent(validate_birthdays(birthdays))
  res <- validate_birthdays(birthdays)
  expect_s3_class(res, "birthdays")
})

test_that("birthdays validator fails as expected", {
  df <- data.frame(
    names = c("kevin", "stacey"),
    birthdays = c(as.Date("2001-01-01"), as.Date("2002-01-02"))
  )
  expect_error(
    birthdays(df),
    regexp = "input must contain 'name' and 'birthday' columns"
  )
})

test_that("birthdays print method works as expected", {
  df <- data.frame(
    name = c("kevin", "stacey"),
    birthday = c(as.Date("2001-01-01"), as.Date("2002-01-02"))
  )
  birthdays <- birthdays(df)

  expect_output(print(birthdays))
})
