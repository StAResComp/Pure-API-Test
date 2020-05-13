[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# Pure API Test Utility

A Bash-based utility for testing the Pure API by making and logging requests
and their responses and facilitating their comparison. The primary use case is
the comparison of request responses before and after a Pure upgrade.

## Dependencies

SQLite, cURL, xmllint, [json-diff](https://github.com/andreyvit/json-diff)

## Installation

Put this the contents of this repository somewhere on your `PATH`.

## Usage

### Making Requests

Make a request using:

```bash
pure_api_request REQUEST [FORMAT] [COMMENT]
```

where

- `REQUEST` is either:
  - a Pure API request **excluding the API key**, either in full or from the
API version number onwards e.g.
    - https://riswebtest.st-andrews.ac.uk/ws/api/516/research-outputs
    - 516/research-outputs
  - the ID of a previously executed query
- `FORMAT` is either `json` or `xml` (defaults to `json` if omitted)
- `COMMENT` is a comment to be recorded with the response

On first run, you will be asked to specify a working directory, a Pure domain
(any full-URL requests should match this) and a Pure API Key. These details are
recorded in `~/.pureApiTestConfig`.

When a request is made, details are logged within `pureApiTest.sqlite` in the
working directory specified in the config file. The bodies of successful
responses are saved in the responses directory in the working directory.

### Listing Requests and Responses

The command

```bash
pure_api_list [REQUEST_ID]
```

Can be used to list details of requests and responses. If `REQUEST_ID` is
missing, all requests are listed. If a `REQUEST_ID` is supplied, details of all
responses to that request are listed.

### Comparing Responses

Compare two responses by running

```bash
pure_api_diff RESPONSE_1_ID RESPONSE_2_ID
```

Note that comparing JSON requires
[json-diff](https://github.com/andreyvit/json-diff) while comparing XML
requires xmllint.

Copyright 2020 University of St Andrews

Licensed under the terms of the MIT License
