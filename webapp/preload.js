var phoneData = [];

function loadData() {
    phoneData = [];
    console.info("Loaded data");
}

function lookupPhones(houseNum) {
    var phoneNums;
    var url = "/choreo-apis/hoyc/gate-bff/endpoint-1234-6e3/v1.0";
    fetch(url)
        .then(response => {
            if (response.ok) {
                return response.json();
            } else {
                console.log("response is not ok: " + response.status + response.json);
                throw new Error('unable to load data');
            }
        })
        .then(data => {
            // Process the response data here
            console.log(data); // Example: Logging the data to the console
            phoneNums = data;
        })
        .catch(error => {
            console.error(error);
    });
    return phoneNums;
}