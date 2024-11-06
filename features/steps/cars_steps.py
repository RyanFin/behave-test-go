import requests
from behave import given, when, then

@given('the Go application is running')
def step_given_app_is_running(context):
    response = requests.get("http://localhost:8080/health")
    assert response.status_code == 200

@when('I make a GET request to "{endpoint}"')
def step_when_make_get_request(context, endpoint):
    context.response = requests.get(f"http://localhost:8080{endpoint}")

@then('I should receive a {status_code:d} status code')
def step_then_receive_status_code(context, status_code):
    assert context.response.status_code == status_code

@then('the response should contain "status" with value "{value}"')
def step_then_response_contains_status(context, value):
    data = context.response.json()
    assert data.get("status") == value

@then('the response should contain a list of cars')
def step_then_response_contains_list_of_cars(context):
    data = context.response.json()
    assert isinstance(data, list)

@then('each car should have "make", "model", and "year" fields')
def step_then_each_car_has_fields(context):
    cars = context.response.json()
    for car in cars:
        assert "make" in car
        assert "model" in car
        assert "year" in car
