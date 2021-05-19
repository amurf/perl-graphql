# How to

```

docker-compose up

```


App will be running on http://localhost:8080/graphql

# Example query to try:

```
{
  household(id: 2) {
    notes
    address {
      suburb
    }
    survey_week {
      end_day
    }
  }
}

```
