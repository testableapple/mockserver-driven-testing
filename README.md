# MockServer-driven testing

MockServer-Driven Testing (MSDT) is a methodology for developing automated UI tests, which is a custom branch of the Test Driven Development (TDD) methodology.

The main idea is:

- to create a mock server that completely replaces the real backend
- to cover the features supported by a mock server with automated UI tests

![Diagram](/diagram.png)

## POC

### Native Mock Server

#### Usage

1. Open `TestMockServer.xcodeproj`
2. Run the test in `NativeMockServerUITests` target

### Standalone Mock Server

#### Usage

1. Install `ruby` gem:

    ```bash
    gem install sinatra
    ```

2. Start the mock server:

    ```bash
    ruby standalone_mock_server.rb
    ```

3. Open `TestMockServer.xcodeproj`
4. Run the test in `StandaloneMockServerUITests` target
