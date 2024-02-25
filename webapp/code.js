// Get the house number label
var houseNumber = document.getElementById('houseNum');

// Get the select action button
var selectActionBtn = document.getElementById('selectActionBtn');

// Hide action selection page by default and show house number page
var houseNumberPage = document.getElementById('houseNumberPage');
houseNumberPage.style.display = 'block';
var actionSelectionPage = document.getElementById('actionSelectionPage');
actionSelectionPage.style.display = 'none';

function pressKey(num) {
    if (houseNumber.textContent.length < 3 || houseNumber.textContent == '_') {
        if (houseNumber.textContent == '_') {
            houseNumber.textContent = num.toString();
        } else {
            houseNumber.textContent += num.toString();
        }

        // Enable the button when the length is 3
        if (houseNumber.textContent.length === 3) {
            selectActionBtn.style.display = 'block';
        }
    }
}

function backspace() {
    if (houseNumber.textContent.length > 1) {
        houseNumber.textContent = houseNumber.textContent.slice(0, -1);
    } else {
        houseNumber.textContent = '_';
    }
    selectActionBtn.style.display = 'none';
}

function showOptions() {
    actionSelectionPage.style.display = 'block';
    houseNumberPage.style.display = 'none';

    var label = document.createElement("h2");
    label.textContent = 'House Number: ' + houseNumber.textContent;
    label.setAttribute("class", "house");
    actionSelectionPage.appendChild(label);

    var phones = lookupPhones(houseNumber.textContent);
    phones.forEach(ph => {
        var item = document.createElement("p");
        item.setAttribute("class", "phoneListItem");
        item.textContent = "Call " + ph.label + ": ";
        actionSelectionPage.appendChild(item);                     
        var anchor = document.createElement("a");
        item.appendChild(anchor);
        anchor.setAttribute("href", "tel:" + ph.number.replace(/\s/g, ''));
        anchor.textContent = ph.number;      
    });
}

