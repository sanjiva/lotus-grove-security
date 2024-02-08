import ballerina/http;

listener http:Listener hl =  new(9090);

service /house on hl {
    // return the main resident of the house
    resource function get phoneNumbers(int houseNumber) returns string[] {
        return ["John Doe"];
    }
}