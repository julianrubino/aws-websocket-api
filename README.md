## WebSocket API Gateway + Lambda + DynamoDB

This Terraform code creates a WebSocket API in AWS API Gateway

![alt text](https://i.ibb.co/V3v9sG6/amwell-ws-infra.png "WSS API Workflow")

### Simple workflow

1. Install wscat (npm install -g wscat).
2. Establish a WebSocket connection to the WebSocket API.
    `wscat -c wss_api_connection_url`
3. Send a message to the API Gateway endpoint (randomword) that triggers the Lambda to read a random word out of the DynamoDB table.
    `{"action": "randomword"}`
4. The Lambda should return the random word to the API Gateway which should return it to the client which should display it on the screen.