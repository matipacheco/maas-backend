# README

## Dependencies

* Ruby version: 2.7.0.

* Run `bundle install` to install application dependencies.

* Run `rails s` to start the application on http://localhost:3000.

* Database included as a sqlite file.

* Run `rake db:setup` to create the databases and load seeds.

* Run test suite with `bundle exec rspec`


## Domain Model

![Domail Model](./public/diagram.png)

### Notes

#### Availabilities

The `availabilities` table has a reference to both the `employees`, and but the `days` and `hours` in which an Employee is available are both stored as integers. Note: The `day` field represents the index of that day of the week.

| id | monitoring_shift_id | employee_id | day | hour |
| -- |:-------------------:|:-----------:|:---:| ----:|
| 1  |1                    | 1           | 0   | 23   |

This means that for the **first monitoring shift**, the **Employee with ID 1** can work on **Monday** (index 0) at **23:00** hours.

#### Monitoring Schemas

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

This structure states that **from Monday to Friday** a service needs to be monitored **between 19 hours and midnight**, and the **weekend** the service needs to be monitored **from 6 AM to 11 AM**.

#### Monitoring Shifts

The `monitoring_shits` has references to both `services` and `weeks` tables.  The `structure` field of the `monitoring_shits` table stores the confirmed monitoring schedule of a service in a particular week. Monitoring schedule is represented on a structure like the following:

```
  {
    0 => {
      19 =>1,
      20 =>1,
      21 =>1,
      22 =>2,
      23 =>2
    }
    ...
  }
```

Taking the  `structure` of the `monitoring_schema` shown in the previous section, the `structure` of this `monitoring_shit` states that the **Monday** of that week the shift **from 19 hours to 22 hours** will be in charge of the **Employee with ID 1**, and the second shift, **from 22 hours to midnight**, will be in charge of the **Employee with ID 2**.


## Assessment Assumptions

1. Any Employee can be assigned to the Monitoring Shift of any Service.
2. A Service can only have one Monitoring Schema.
3. It is assumed that all Weeks start on a Monday.
4. It is assumed that `structure` hash field of a Monitoring Schema, is always sorted. Meaning that the first key of the hash is always zero (Monday), and the last key is always 6 (Sunday).

## Additional Comments

1. Maintainers for Employees, Services, Weeks, and Monitoring Schemas were not considered in the development of the MVP.
2. The project seeds populates the database with:
    * 2 Services called Recorrido, and Brutal.
    * 2 Monitoring Schemas, one for each Service shown above.
    * 5 Weeks. The current week + 4 weeks in the future.
    * 1 Monitoring Shift, for the **first week** of the **Recorrido** service monitoring.
    * 3 Employees called Mati, Benjamín, and Lennart.
    * For the only monitoring shift created, the employees' availabilities are created randomly.

3. The algorithm to fill a Monitoring Shift works like this:
    1. Shifts are build day by day, starting on Monday and ending on Sunday.
    2. In each day, it starts by assigning time blocks to the employee that currently has less time blocks assigned (To give the chance that all employees have a balanced work load).
    3. Whenever an employee isn't available on a given time block, it selects the employee who has the most consecutive time blocks starting that point (To reduce shift changing).

, this is explained in the `ShiftCalculatorService` as well.