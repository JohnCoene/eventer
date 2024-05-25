<!-- badges: start -->
<!-- badges: end -->

# eventer

Event emitter and listener in R.

## Installation

You can install the development version of eventer like so:

``` r
# install.packages("remotes")
remotes::install_github("JohnCoene/eventer")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(eventer)

listener1 <- function(...) {
  cat("Listener 1 received:", ..., "\n")
}

listener2 <- function(...) {
  cat("Listener 2 received:", ..., "\n")
}

# instantiate
e <- event()

# register listeners
e$on("event1", listener1)
e$on("event1", listener2)
e$on("event2", listener1)

# emit events
e$emit("event1", "Hello", "World")
e$emit("event2", "Another", "Event")

# will not trigger on, listener is unregistered
e$off("event1", listener2)
e$emit("event1", "Hello again")
```

