Rails 4 API
===========

[![Build Status](https://travis-ci.org/emilsoman/rails-4-api.png)](https://travis-ci.org/emilsoman/rails-4-api)

After I published my blog post on [Building a Tested, Documented and Versioned JSON API Using Rails 4](http://www.emilsoman.com/blog/2013/05/18/building-a-tested/),
many readers asked me for a sample template app. So here it is. Feel free to send in pull requests.

This is a template Rails 4 app which has the following to start with :

1. Rails-API - Rails for API only apps
2. Devise for token based authentication
3. Cucumber for integration testing + up-to-date API documentation
4. Versioning using the "Accept" header
5. Does not depend on cookies/session.( In simple words, the API client need not be a browser )

## Getting started

    cd rails-4-api
    bundle install --without production
    RAILS_ENV=test bundle exec rake db:setup #Setup the test DB
    bundle exec rake #Build ( RSpec + Cucumber )
    #open public/api_doc.html in your browser
    
## Why use Cucumber ?

I get this question a lot : "Why use Cucumber for API testing ? Why not RSpec controller/request specs ?"

1. Cucumber is good at one thing : integration testing using user interaction expressed as steps. API testing = 
integration testing , where the user = any API client that can interact with the API in the language of HTTP requests. Use Rack::Test for
HTTP request/response instead of Capybara for page interaction, now you can write API client interaction as steps
and write readable and expressive integration tests.
2. I want to use the output of the test suite as documentation for my APIs. Cucumber output is perfect for this, because
cucumber forces you to write sequences of steps in a natural language. You would need a hell lot of ruby blocks in RSpec
to produce an output that can act as a self explanatory documentation.
3. Personal choice. I use RSpec heavily for unit test and I find RSpec is a good fit for that. But writing integration
tests in RSpec doesn't look good to me. But to each his own, there's nothing stopping you from using RSpec for the job.
Read this excellent blog post to see [how you can use RSpec to test APIs](http://matthewlehner.net/rails-api-testing-guidelines/)



