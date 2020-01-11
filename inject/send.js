function sendFacebook(message){
	var textbox = document.querySelector('[data-text="true"]'); 

	textbox.textContent =  message;

	var event = new Event('input', { bubbles: true }); 
	textbox.dispatchEvent(event);

	var sendButton = document.querySelector('[aria-label="Send"]');   
	sendButton.click(); 
}

function randomPickupLine(){
	var pickuplines = [
		randomStarwarsQuote(),
		"Ciao, l'hai visto " + randomFilmName()+" ?",
		"Toc Toc",
		"Vendo broccoli, ne vuoi un po'?",
		"Ciao, studi "+randomField()+" ?",
		"Scusa mi sono perso, dove sono?"

	];
	return randomItem(pickuplines);
}


function randomStarwarsQuote(){
	var quotes = [
		'Ti hanno mai detto della tragica fine di Darth Plagueis il Saggio?',
		'Hello There',
	];
	return randomItem(quotes);
	
}

function randomField(){
	var fieldNames = [
		'Medicina',
		'Psicologia',
		'Scienze Politiche',
		"Ingegneria"
	];
	return randomItem(fieldNames);
}

function randomFilmName(){
	var filmNames = [
		'Tolo Tolo',
		'Pinocchio',
		'il nuovo Jumanji',
		"l'ascesa di Skywalker"
	];
	return randomItem(filmNames);
}

function randomItem(items){
	items = shuffle(items);

	var item = items[Math.floor(Math.random()*(items.length))];
	return item;
}


function shuffle(array) {
  for (let i = array.length - 1; i > 0; i--) {
    let j = Math.floor(Math.random() * (i + 1)); // random index from 0 to i

    // swap elements array[i] and array[j]
    // we use "destructuring assignment" syntax to achieve that
    // you'll find more details about that syntax in later chapters
    // same can be written as:
    // let t = array[i]; array[i] = array[j]; array[j] = t
    [array[i], array[j]] = [array[j], array[i]];
  }
  return array;
 }

var message = randomPickupLine(); 
//alert(message);
sendFacebook(message);