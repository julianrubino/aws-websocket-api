## WebSocket API Gateway + Lambda + DynamoDB

![alt text](https://i.ibb.co/V3v9sG6/amwell-ws-infra.png "WSS API Workflow")

This Terraform code creates a WebSocket API in AWS API Gateway.

![alt text](https://s3.gifyu.com/images/ezgif.com-gif-makerec37cba4736ba86e.gif "WSS API Workflow")

### Client
1. You can use the client of your choice. Consider using wscat.

### Server-side

1. Configure an AWS API gateway endpoint which maintains a WebSocket to
the client
2. A Lambda connected to the API gateway endpoint which responds to
requests sent to the API gateway
3. A DynamoDB collection which contains a set of random words
        `[{ “word”: “car“}, {“word“: “truck“}, {“word“: “banana“}]`

### Simple workflow
1. Install wscat (npm install -g wscat).
2. Establish a WebSocket connection to the WebSocket API.
    `wscat -c wss_api_connection_url`
3. Send a message to the API Gateway endpoint (randomword) that triggers the Lambda to read a random word out of the DynamoDB table.
    `{"action": "randomword"}`
4. The Lambda should return the random word to the API Gateway which should return it to the client which should display it on the screen.