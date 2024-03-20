# Shop CLI
This is the solution for the Subscribe Coding Challenge.
For more information about the challenge, please refer to the [challenge.md](challenge.md) file.

## How to run
This is a CLI application. To run it, you need to have Ruby 3.2 installed on your machine or use Docker.

### Running with Ruby
Run the following command:
```bash
ruby app.rb
```
> You can add, list, show the cart and total. For any help, type `help`.

### Running with Docker
Run the following command:
```bash
docker build -t shop-cli .
docker run -it shop-cli
```

## Assumptions
- The items will be added to the cart one by one, each with its own quantity.
- No item will have a quantity less than 1.
- No item will have a price less than 0.

## Running the test suite
The test suite is written using RSpec. To run the tests, first install the dependencies:
```bash
bundle install
```
Then, run the tests:
```bash
bundle exec rspec
```
> If you are using Docker, you can run the tests using `docker run shop-cli rspec`.
