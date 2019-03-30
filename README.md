ruby-caldav
==============

Ruby client for searching, creating and editing CalDAV calendars and tasks.

# Installation

```ruby
gem install 'ruby-caldav'
```

# Usage

```ruby
require 'ruby-caldav'

u = "user1"

cal = CalDAV::Client.new(:uri => "http://yourserver.com:8008/calendars/users/#{u}/calendar/", :user => u , :password => "xxxxxx")
```

# Find events

```ruby
result = cal.find_events(:start => "2019-04-01", :end => "2019-04-15")
```

# Create new event

```ruby
result = cal.create_event(:start => "2019-04-12 10:00", :end => "2019-04-12 12:00", :title => "Meeting with Me", :description => "Meeting about nothing...:D")
```
