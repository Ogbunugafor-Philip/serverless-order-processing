import {
    CognitoIdentityProviderClient,
    SignUpCommand,
    InitiateAuthCommand
  } from "@aws-sdk/client-cognito-identity-provider";
  
  // ✅ Filled-in Cognito values
  const REGION = "us-east-1";
  const USER_POOL_ID = "us-east-1_KdeVw12Lp";
  const CLIENT_ID = "1tbgi7ofnmomeeoh2563rt31il";
  
  const client = new CognitoIdentityProviderClient({ region: REGION });
  
  export const signUp = async (email, password) => {
    const input = {
      ClientId: CLIENT_ID,
      Username: email,
      Password: password,
      UserAttributes: [
        {
          Name: "email",
          Value: email,
        },
      ],
    };
  
    const command = new SignUpCommand(input);
    return await client.send(command);
  };
  
  export const signIn = async (email, password) => {
    const input = {
      AuthFlow: "USER_PASSWORD_AUTH",
      ClientId: CLIENT_ID,
      AuthParameters: {
        USERNAME: email,
        PASSWORD: password,
      },
    };
  
    const command = new InitiateAuthCommand(input);
    return await client.send(command);
  };
  