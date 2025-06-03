
# Simple test to check classes 
expect_equal(class(hapsinatoR(100)), "hapsinatoR") # should work
expect_equal(class(hapsinatoR()$candyShelf), "data.frame")
expect_equal(class(hapsinatoR()$numHaps), "numeric")
expect_equal(class(hapsinatoR()$gramsToMix), "numeric")
expect_equal(class(hapsinatoR()$uniqueCandies), "numeric")
expect_equal(class(hapsinatoR()$hapsSizes), "numeric")