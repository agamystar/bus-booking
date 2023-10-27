## Configuration

### - Upload the attached sql file 
### - Import the attached postman file  collection 
### - Config your env 

## Endpoints
- http://127.0.0.1:8000/api/show-available-trips
- http://127.0.0.1:8000/api/show-available-seats
- http://127.0.0.1:8000/api/book

## Notes
-update these lines in phpunit.xml and change the values to your local env values      
because i created some features tests

        <env name="DB_DATABASE" value="bus_app_db"/>
        <env name="DB_USERNAME" value="mvc_user"/>
        <env name="DB_PASSWORD" value="mvc_password"/>
