function IMAPReceivedDate() {
    var prefService = Components.classes["@mozilla.org/preferences-service;1"]
        .getService(Components.interfaces.nsIPrefBranch);
    var headers = prefService.getCharPref("mailnews.customDBHeaders");
    if (headers.search(/(^| )Received( |$)/i) < 0) {
	headers = headers + " Received";
	prefService.setCharPref("mailnews.customDBHeaders", headers);
    }
}

window.addEventListener("load", IMAPReceivedDate, false);
