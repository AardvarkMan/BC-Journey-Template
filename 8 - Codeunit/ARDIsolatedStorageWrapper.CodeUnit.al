codeunit 50002 ARD_IsolatedStorageWrapper
{
    SingleInstance = true;
    Access = Internal;

    var
        IsolatedStorageSecretKeyKeyLbl: Label 'CopilotSecret', Locked = true;
        IsolatedStorageDeploymentKeyLbl: Label 'CopilotDeployment', Locked = true;
        IsolatedStorageEndpointKeyLbl: Label 'CopilotEndpoint', Locked = true;

    procedure GetSecretKey() SecretKey: Text
    begin
        if IsolatedStorage.Get(IsolatedStorageSecretKeyKeyLbl, SecretKey) = false then SecretKey := '';
    end;

    procedure GetDeployment() Deployment: Text
    begin
        if IsolatedStorage.Get(IsolatedStorageDeploymentKeyLbl, Deployment) = false then Deployment := '';
    end;

    procedure GetEndpoint() Endpoint: Text
    begin
        if IsolatedStorage.Get(IsolatedStorageEndpointKeyLbl, Endpoint) = false then Endpoint := '';
    end;

    procedure SetSecretKey(SecretKey: Text)
    begin
        IsolatedStorage.Set(IsolatedStorageSecretKeyKeyLbl, SecretKey);
    end;

    procedure SetDeployment(Deployment: Text)
    begin
        IsolatedStorage.Set(IsolatedStorageDeploymentKeyLbl, Deployment);
    end;

    procedure SetEndpoint(Endpoint: Text)
    begin
        IsolatedStorage.Set(IsolatedStorageEndpointKeyLbl, Endpoint);
    end;

}