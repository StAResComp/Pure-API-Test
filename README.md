[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# Pure API Test Utility

A utility for testing the Pure API by making and logging requests and their
responses and facilitating their comparison. The primary use case is the
comparison of request responses before and after a Pure upgrade.

## Dependencies

SQLite, cURL

## Usage

### Making Requests

Put this the contents of this repository somewhere on your `PATH`. Make a
request by:

```bash
pure_api_request REQUEST [FORMAT]
```

where

- `REQUEST` is either:
  - a Pure API request **excluding the API key**, either in full or from the
API version number onwards e.g.
    - https://riswebtest.st-andrews.ac.uk/ws/api/516/research-outputs
    - 516/research-outputs
  - the ID of a previously executed query
- `FORMAT` is either `json` or `xml` (defaults to `json` if omitted)

On first run, you will be asked to specify a working directory, a Pure domain
(any full-URL requests should match this) and a Pure API Key. These details are
recorded in `~/.pureApiTestConfig`.

When a request is made, details are logged within `pureApiTest.sqlite` in the
working directory specified in the config file. The bodies of successful
responses are saved in the responses directory in the working directory.

### Comparing Responses

TODO

Copyright 2020 University of St Andrews

Licensed under the terms of the MIT License
