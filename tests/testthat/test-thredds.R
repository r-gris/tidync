context("thredds")

test_that("thredds works", {
  skip_on_travis()
  skip_on_cran()
  skip_on_appveyor()
  library(tidync)
  u <- "https://coastwatch.pfeg.noaa.gov/erddap/griddap/erdQSwind3day"
  unc <- tidync(u)
  expect_named(unc, c("source", "axis", "grid", 
                      "dimension", "variable", "transforms"))
})


