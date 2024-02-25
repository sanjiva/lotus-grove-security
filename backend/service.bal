import ballerina/http;
import ballerina/log;

listener http:Listener hl = new (1234);

type HousePhone record {
    string id;
    string label;
    string number;
};

service / on hl {

    resource function get housePhones/[int number]() returns HousePhone[] {
        log:printInfo("Returning phone # for house number " + number.toString());
        return [
                    { id: "home", label: "Home", number: "011 273 3719" },
                    { id: "sanjiva", label: "Sanjiva", number: "077 787 6880" },
                    { id: "assistant", label: "Thilaxshana", number: "077 777 7777" },
                    { id: "security", label: "Dharmasena", number: "071 000 0000" }
            ];
    }

    resource function get housePhones() returns record {string number; HousePhone[] phones;}[] {
        record {string number; HousePhone[] phones;}[] phones = [
            { number: "201", 
              phones: [
                    { id: "home", label: "Home", number: "011 273 3719" },
                    { id: "sanjiva", label: "Sanjiva", number: "077 787 6880" },
                    { id: "assistant", label: "Thilaxshana", number: "077 777 7777" },
                    { id: "security", label: "Dharmasena", number: "071 000 0000" }
              ]},
            { number: "200", 
              phones: [
                    { id: "home", label: "Home", number: "011 273 3719" },
                    { id: "sanjiva", label: "Sanjiva", number: "077 787 6880" },
                    { id: "assistant", label: "Thilaxshana", number: "077 777 7777" },
                    { id: "security", label: "Dharmasena", number: "071 000 0000" }
              ]},
            { number: "195", 
              phones: [
                    { id: "home", label: "Home", number: "011 273 3719" },
                    { id: "sanjiva", label: "Sanjiva", number: "077 787 6880" },
                    { id: "assistant", label: "Thilaxshana", number: "077 777 7777" },
                    { id: "security", label: "Dharmasena", number: "071 000 0000" }
              ]}
        ];
        return phones;
    }
}
