import ballerina/persist as _;

type Phone record {|
    readonly string id;
    string number;
    boolean textOK;
    boolean whatsappOK;
    boolean callOK;
    Person person;
|};

type Person record {|
    readonly string id;
    string name;
    string[] email;
    Phone[] phones;
	House house;
	House house1;
|};

type Visitor record {|
    readonly string id;
    string name;
    string visitingTime;
    string? email;
    string? phoneNumber;
    int houseNumber; // houses the person is visiting
|};

type House record {|
    readonly string id;
    int number;
    string? homePhone;
    Person[] owners;
    boolean isRented;
    Person[] residents;
|};
