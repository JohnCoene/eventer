#' Event Class
#' Create an event emitter and listener
#' @field listeners Registered listeners.
#' @importFrom methods new
#' @exportClass Event
Event <- setRefClass(
  "Event",
  fields = list(
    listeners = "list"
  ),
  methods = list(
    initialize = function() {
      listeners <<- list()
    },
    on = function(event_name, listener) {
      if (!event_name %in% names(listeners)) {
        listeners[[event_name]] <<- list()
      }
      listeners[[event_name]] <<- c(listeners[[event_name]], list(listener))
    },
    emit = function(event_name, ...) {
      if (event_name %in% names(listeners)) {
        for (listener in listeners[[event_name]]) {
          listener(...)
        }
      }
    },
    off = function(event_name, listener) {
      listeners <<- listeners[names(listeners) != event_name]
    }
  )
)

#' Event
#' Instantiate an event.
#' @export
event <- function(){
  Event$new()
}
