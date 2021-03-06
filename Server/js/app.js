App.onLaunch = function(options) {

	var javascriptFiles = [
		`${options.BASE_URL}/js/resourceLoader.js`,
		`${options.BASE_URL}/js/presenter.js`
	];

	evaluateScripts(javascriptFiles, function(success) {

		if(success) {

			resourceLoader = new ResourceLoader(options.BASE_URL);
			resourceLoader.loadResource(`${options.BASE_URL}/templates/devConferenceTemplate.xml.js`, function(resource) {
				var doc = Presenter.makeDocument(resource);
				doc.addEventListener("select", Presenter.load.bind(Presenter)); 
        		Presenter.pushDocument(doc);
			});
		} else {
			var errorDoc = createAlert("Evaluate Scripts Error", "Error attempting to evaluate external JavaScript files.");
      		navigationDocument.presentModal(errorDoc);
		}
	});
}

var createAlert = function(title, description) {
	var alertString = `<?xml version="1.0" encoding="UTF-8" ?>
			<document>
				<alertTemplate>
					<title>${title}</title>
					<description>${description}</description>
					<button>
						<text>OK</text>
					</button>
				</alertTemplate>
			</document>`

	var parser = new DOMParser();
	var alertDoc = parser.parseFromString(alertString, "application/xml");
	return alertDoc
}
