variable region { default = "us-east-1" }

variable aws_credentials { default = "techops-admin" }

variable lambda_handler { default = "lambda_handler.lambda_handler" }

variable lambda_runtime { default = "python3.8" }

variable lambda_invoke_permission { default = "lambda:InvokeFunction" }

variable api_gateway_dns { default = "apigateway.amazonaws.com" }

variable default_function_name { default = "defaultWebSocket" }

variable connect_function_name { default = "connectWebSocket" }

variable disconnect_function_name { default = "disconnectWebSocket" }

variable random_word_function_name { default = "getRandomWord" }
