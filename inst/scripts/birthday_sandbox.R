# test birthdays class and methods

df <- data.frame(
  name = c("kevin", "stacey"),
  birthday = c(as.Date("2001-01-01"), as.Date("2002-01-02"))
)
birthdays <- birthdays(df)
class(birthdays)


# methods
print(birthdays)
summary(birthdays)
str(birthdays)

# check invisible return
tmp <- print(birthdays)
tmp == birthdays

# use methods

print(birthdays)
birthdays_per_month(birthdays)

validate_birthdays(birthdays)
validate_birthdays(birthdays[, 1])
validate_birthdays(birthdays[, 2])
validate_birthdays(birthdays[1, ])
validate_birthdays(birthdays[2, ])
birthdays$age <-  seq_len((birthdays))
birthdays
validate_birthdays(birthdays)


birthdays[, 1]


birthdays
birthday_paradox(birthdays)

df <- data.frame(
  name = randomNames::randomNames(10),
  birthday = sample(
    x = seq.Date(
      from = as.Date("2020-01-01"),
      to = as.Date("2022-01-01"),
      by = 1),
    size = 10
  )
)
birthdays <- birthdays(df)

#' df = data.frame(
#'   name = c("kevin", "stacey"),
#'   birthday = c(as.Date("2001-01-01"), as.Date("2002-01-02"))
#' )
#' birthdays(df)
