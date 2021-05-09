import json
import boto3
import random

def lambda_handler(event, context):
    ### Get DynamoDB resource
    dynamodb = boto3.resource('dynamodb', region_name="us-east-1")
    
    ### Get RandomWords table
    table = dynamodb.Table('RandomWords')
    
    ### Scan RandomWords table
    table_scan = table.scan()
    
    ### Get all words in table
    words = table_scan['Items']
    
    ### Choose a random word
    random_word = random.choice(words)
    
    ### Format body message with random word
    message = "Your random word is: " + random_word['word']
    
    return {
        'statusCode': 200,
        'body': message
    }
