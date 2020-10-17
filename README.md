# README

## Dependencies

* Ruby version: 2.7.0.

* Run `bundle install` to install application dependencies.

* Database included as a sqlite file.

* Run `rake db:setup` to create the databases and load seeds.

* Run test suite with `bundle exec rspec`

## Domain Model

![Domail Model](./public/diagram.png)

### Note

The `monitoring_schemas` table has a `JSON` field named `structure`. This field stores the schedule delivered by a client for their service to be monitored. This schedule is a hash, in which the keys represents a day of the week by its index, and the values are arrays that represent a range of hours of the day.

For example:
```
  {
    0 => [19, 20, 21, 22, 23],
    1 => [19, 20, 21, 22, 23],
    2 => [19, 20, 21, 22, 23],
    3 => [19, 20, 21, 22, 23],
    4 => [19, 20, 21, 22, 23],
    5 => [6, 7, 8, 9, 10],
    6 => [6, 7, 8, 9, 10]
  }
```

This structure states that from Monday to Friday a service needs to be monitored between 19 hours and midnight, and the weekend the serivice needs to be monitored from 6 AM to 11 AM.

## Assessment Assumptions

1. Any Employee can be assigned to the Monitoring Shift of any Service.
2. Employee availability is always the same.
3. A Service can only have one Monitoring Schema.
4. It is assumed that the services will be monitored in consecutive blocks of time.
5. It is assumed that all Weeks start on a Monday.
6. Maintainers for Employees, Services, Weeks, and Monitoring Schemas were not considered in the development of the MVP.
