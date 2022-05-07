local notify = require "notify"

vim.notify = notify

print = function(msg)
   notify(msg, "info")
end

error = function(msg)
   notify(msg, "error")
end

warn = function(msg)
   notify(msg, "warn")
end
