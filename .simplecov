require 'simplecov'

SimpleCov.start do
   add_filter 'app/workers/'
   add_filter 'app/helpers/'
end