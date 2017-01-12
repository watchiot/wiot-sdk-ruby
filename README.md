[![Stories in Ready](https://badge.waffle.io/watchiot/wiot-sdk-ruby.png?label=ready&title=Ready)](https://waffle.io/watchiot/wiot-sdk-ruby)
[![Build Status](https://travis-ci.org/watchiot/wiot-sdk-ruby.svg?branch=master)](https://travis-ci.org/watchiot/wiot-sdk-ruby) [![Code Climate](https://codeclimate.com/github/watchiot/wiot-sdk-ruby/badges/gpa.svg)](https://codeclimate.com/github/watchiot/wiot-sdk-ruby) [![Test Coverage](https://codeclimate.com/github/watchiot/wiot-sdk-ruby/badges/coverage.svg)](https://codeclimate.com/github/watchiot/wiot-sdk-ruby/coverage) [![Issue Count](https://codeclimate.com/github/watchiot/wiot-sdk-ruby/badges/issue_count.svg)](https://codeclimate.com/github/watchiot/wiot-sdk-ruby) [![Gem Version](https://badge.fury.io/rb/wiot_sdk.svg)](https://badge.fury.io/rb/wiot_sdk)

# Watchiot SDK for Ruby

If you want to create an monitor agent in **Ruby** we suggest use this **gem**, it contains easy way to interact with our api.

## Install

```bash
$ gem install wiot-sdk
```

## Usage

First you need to add the dependence in your *Gemfile* project 

```ruby
gem 'wiot-sdk', '~> 0.1'
```

Then you have to require the sdk where are you going to use it

```ruby
require 'wiot-sdk'
```

Now you have to initialice the **SDK** setting the mandatory configuration variables that always will be send in each request. This parameters are:

**api key**, **name space** and **name project**
 
```ruby
def init_sdk
  my_api_key = 'asd123asd-23asd-123sda-1231234saa'
  my_namespace = 'my_space'
  my_project = 'my_project'
  
  client = WiotSdk.init my_api_key, my_namespace, my_project
end
```

The other way is put it into configuration file **yml** or **json** format and then set the path where this parameters are setting. 

```ruby
def init_sdk
  my_config_json = '/home/myhome/my_agent/my_agent.json'
 
  client = WiotSdk.init my_config_json
end
```

```ruby
def init_sdk
  my_config_yml = '/home/myhome/my_agent/my_agent.yml'
  
  client = WiotSdk.init my_config_yml
end
```
Example of config file

* json
```json
{
  api_key: "asd123asd-23asd-123sda-1231234saa",
  space  : "my_space",
  project: "my_project"
}
```

* yml
```yml
api_key: "asd123asd-23asd-123sda-1231234saa"
space  : "my_space"
project: "my_project"
```

Now you are ready to send us a request with the metrics that you recollect.

To fill the **metric** we provide you a *Metric class*

```ruby
require 'wiot_sdk/metric'

def fill_metric
 metric = Metric.new
 
 metric.add('my_param1', 'my_malue1')
 metric.add('my_param2', 'my_malue2')
 metric.add('my_param3', 'my_malue3')
 ...
 metric.add('my_paramN', 'my_malueN')
end
```
Whe you have the **metric** only you need send a **request** to us

```ruby

def request
 client = init_sdk
 metric = fill_metric
 
 response = client.send metric
end
```

* Response
 
If all was fine you are going to recive

```http
HTTP/1.1 200 OK
Server: nginx
Date: Fri, 16 Nov 2016 21:03:12 GMT
Content-Type: application/json; charset=utf-8
Connection: keep-alive
Status: 200 OK
Rate-Limit: 800
Rate-Remaining: 745
Rate-Reset: 2150085394
Content-Length: 5 
```
```ruby

def request
 client = init_sdk
 metric = fill_metric
 
 response = client.send metric
 puts response.code
end
```

OUTPUT: 200

* Rate limit

 Rate-Limit: 60 The maximum number of requests per hour.
 Rate-Remaining: 56 The number of requests remaining in the current rate limit window.
 Rate-Reset: 1372700873 The time at which the current rate limit window reset in miliseconds.

GET /rate_limit

Status: 200 OK
X-RateLimit-Limit: 5000
X-RateLimit-Remaining: 4999
X-RateLimit-Reset: 1372700873

{
  "resources": {
    "core": {
      "limit": 5000,
      "remaining": 4999,
      "reset": 1372700873
    },
    "search": {
      "limit": 30,
      "remaining": 18,
      "reset": 1372697452
    }
  },
  "rate": {
    "limit": 5000,
    "remaining": 4999,
    "reset": 1372700873
  }
}


* Errors

Sending invalid JSON will result in a 400 Bad Request response.

 HTTP/1.1 400 Bad Request
 Content-Length: 35

 {"message":"Problems parsing JSON"}
 
 Sending the wrong type of JSON values will result in a 400 Bad Request response.

 HTTP/1.1 400 Bad Request
 Content-Length: 40

 {"message":"Body should be a valid JSON"}

 Sending invalid fields will result in a 422 Unprocessable Entity response.

 HTTP/1.1 422 Unprocessable Entity
 Content-Length: 149

 {
   "message": "Validation Failed",
   "errors": [
     {
       "field": "title",
       "code": "missing_field"
     }
   ]
 }
 
 HTTP/1.1 401 Unauthorized

{
  "message": "Bad credentials"
}

HTTP/1.1 403 Forbidden
Content-Type: application/json; charset=utf-8
Connection: close

{
  "message": "You have been temporarily blocked for have an abuse behavior. Please retry your request more later."
}

HTTP/1.1 403 Forbidden

{
  "message": "Maximum number of login attempts exceeded. Please try again later."
}

HTTP/1.1 403 Forbidden
Date: Tue, 20 Aug 2013 14:50:41 GMT
Status: 403 Forbidden
Rate-Limit: 800
Rate-Remaining: 0
Rate-Reset: 1377013266

{
   "message": "API rate limit exceeded"
}


## License

(The MIT License)

Copyright (c) 2016 WatchIoT

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

