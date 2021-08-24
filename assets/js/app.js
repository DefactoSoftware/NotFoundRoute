// assets/js/app.js
import {Socket, LongPoll} from "phoenix"
import {LiveSocket} from "phoenix_live_view"

let livePath = document.querySelector("html").getAttribute("phx-socket")
let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket(livePath, Socket, {params: {_csrf_token: csrfToken}})

const socket = liveSocket.socket
const originalOnConnError = socket.onConnError
let fallbackToLongPoll = true

socket.onOpen(() => {
  fallbackToLongPoll = false
})

socket.onConnError = (...args) => {
  if (fallbackToLongPoll) {
    // No longer fallback to longpoll
    fallbackToLongPoll = false
    // close the socket with an error code
    socket.disconnect(null, 3000)
    // fall back to long poll
    socket.transport = LongPoll
    // reopen
    socket.connect()
  } else {
    originalOnConnError.apply(socket, args)
  }
}

// Connect if there are any LiveViews on the page
liveSocket.connect()

// Expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)
// The latency simulator is enabled for the duration of the browser session.
// Call disableLatencySim() to disable:
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket
