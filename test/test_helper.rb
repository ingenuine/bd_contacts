ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def headers
    headers = {}
    headers['Authorization'] = "Bearer eyJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJwYXJjLWNsaSIsInN1YiI6eyJpZCI6IjQyIiwiZW1haWwiOiJ0ZXN0QGJldHRlcmRvYy5kZSJ9LCJpYXQiOjE2MTEzMDg1NzUsImV4cCI6MTYxMTMwODY5NX0.poHofWBp9OimU1g4dG1C9PjFcYHEqge4TLrfdYbWmnOGpXA53Hc_PIybZ52t63fXVpkqAwrRAAHNCJB-P0cCxavwzvoXlqLkikVNK0g9HrNCUS7QdIhCGmU2ZUWwW83zIvXtBAdeIohbjM7aKY28Su6fyP9Suwb0pm3ekuVY287X0OLbtObRrWzqBY4sTmRSTaFkdwFo1AZskb1mTeVrOGc30uMZX54CS9uhdCB6JIksIZa-wwGYBx-w6liSh5oSad2YxUmd1IAeVhFBev3t7jKpSGh-MWL4x3vYSjGrRH0NB16i3RI1mXyVWrfSRx8EdGqcsgkI00x7z7b5p8f3CA"
    return headers
  end
end
