var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;
var SpeechGrammarList = SpeechGrammarList || webkitSpeechGrammarList;
var SpeechRecognitionEvent = SpeechRecognitionEvent || webkitSpeechRecognitionEvent;

var nouns = ['Baum'];
var grammar = '#JSGF V1.0; grammar nouns; public <nouns> = ' + nouns.join(' | ') + ' ;';

var recognition = new SpeechRecognition();
var speechRecognitionList = new SpeechGrammarList();

speechRecognitionList.addFromString(grammar, 1);
recognition.grammars = speechRecognitionList;
// recognition.lang = 'en-US';
recognition.lang = 'de-CH';

recognition.interimResults = false;
recognition.maxAlternatives = 1;

// Recording
window.onload = function() {
  if (document.getElementsByClassName("js-recognition").length > 0) {
        recognition.start();
        document.getElementById("js-recognition-status").innerHTML = 'Ready to receive your answer';
  }

  if (document.getElementById('js-next-question') !== null) {
        setTimeout(function(){
            document.getElementById("js-next-question").click();
        }, 2000);
  }
};

// Stop recording after a word has been recognized
recognition.onspeechend = function() {
    recognition.stop();
};

// When no match was found
recognition.onnomatch = function() {
    console.log('Answer could not be figured out');
};

// When error happens
recognition.onerror = function() {
    console.log('Error occured in recognition: ' + event.error);
};

// Recorded
recognition.onresult = function(event) {
    console.log('event', event);
    var last = event.results.length - 1;
    var noun = event.results[last][0].transcript;
    console.log('last ', last);
    console.log('noun ', noun);
    console.log('Confidence ' + event.results[0][0].confidence);

    document.getElementById('user_answer').value = noun;
    document.getElementById('js-submit-answer').submit();
};
