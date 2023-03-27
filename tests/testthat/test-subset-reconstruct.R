test_that("subsetting works as expected removing invariant", {

  df <- data.frame(
    name = c("kevin", "stacey"),
    birthday = c(as.Date("2001-01-01"), as.Date("2002-01-02"))
  )
  birthdays <- birthdays(df)
  res <- birthdays[, 1]

  expect_s3_class(res, "data.frame")
  expect_identical(dim(res), c(2L, 1L))
})

test_that("subsetting works as expected removing non-invariant", {

  df <- data.frame(
    name = c("kevin", "stacey"),
    birthday = c(as.Date("2001-01-01"), as.Date("2002-01-02")),
    age = c(35, 27)
  )
  birthdays <- birthdays(df)
  res <- birthdays[, -3]

  expect_s3_class(res, "birthdays")
  expect_identical(dim(res), c(2L, 2L))
  expect_named(res, c("name", "birthday"))
})

test_that("naming works as expected removing invariant", {

  df <- data.frame(
    name = c("kevin", "stacey"),
    birthday = c(as.Date("2001-01-01"), as.Date("2002-01-02"))
  )
  birthdays <- birthdays(df)
  names(birthdays) <- c("names", "string")
  res <- birthdays

  expect_s3_class(res, "data.frame")
  expect_identical(dim(res), c(2L, 2L))
})

test_that("naming works as expected removing non-invariant", {

  df <- data.frame(
    name = c("kevin", "stacey"),
    birthday = c(as.Date("2001-01-01"), as.Date("2002-01-02")),
    age = c(35, 27)
  )
  birthdays <- birthdays(df)
  names(birthdays) <- c("name", "birthday", "string")
  res <- birthdays

  expect_s3_class(res, "birthdays")
  expect_identical(dim(res), c(2L, 3L))
  expect_named(res, c("name", "birthday", "string"))
})

test_that("$ setter works as expected changing invariant", {

  df <- data.frame(
    name = c("kevin", "stacey"),
    birthday = c(as.Date("2001-01-01"), as.Date("2002-01-02"))
  )
  birthdays <- birthdays(df)
  birthdays$name <- c(1, 2)
  res <- birthdays

  expect_s3_class(res, "data.frame")
  expect_identical(dim(res), c(2L, 2L))
})

test_that("$ setter works as expected chaning non-invariant", {

  df <- data.frame(
    name = c("kevin", "stacey"),
    birthday = c(as.Date("2001-01-01"), as.Date("2002-01-02")),
    age = c(35, 27)
  )
  birthdays <- birthdays(df)
  birthdays$age <- c("35", "27")
  res <- birthdays

  expect_s3_class(res, "birthdays")
  expect_identical(dim(res), c(2L, 3L))
  expect_named(res, c("name", "birthday", "age"))
})

test_that("dplyr reconstruction works as expected removing invariant", {

  df <- data.frame(
    name = c("kevin", "stacey"),
    birthday = c(as.Date("2001-01-01"), as.Date("2002-01-02"))
  )
  birthdays <- birthdays(df)
  res <- dplyr::select(.data = birthdays, name)

  expect_s3_class(res, "data.frame")
  expect_identical(dim(res), c(2L, 1L))
})

test_that("dplyr reconstruction works as expected removing non-invariant", {

  df <- data.frame(
    name = c("kevin", "stacey"),
    birthday = c(as.Date("2001-01-01"), as.Date("2002-01-02")),
    age = c(35, 27)
  )
  birthdays <- birthdays(df)
  res <- dplyr::select(.data = birthdays, !age)

  expect_s3_class(res, "birthdays")
  expect_identical(dim(res), c(2L, 2L))
  expect_named(res, c("name", "birthday"))
})

test_that("dplyr_reconstruct.birthdays works as expected", {

  df <- data.frame(
    name = c("kevin", "stacey"),
    birthday = c(as.Date("2001-01-01"), as.Date("2002-01-02")),
    age = c(35, 27)
  )
  birthdays <- birthdays(df)
  df <- df[, -3]
  res <- dplyr_reconstruct.birthdays(data = df, template = birthdays)

  expect_s3_class(res, "birthdays")
  expect_identical(dim(res), c(2L, 2L))
  expect_named(res, c("name", "birthday"))
})
