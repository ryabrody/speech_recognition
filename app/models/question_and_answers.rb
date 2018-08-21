class QuestionAndAnswers
  QUESTIONS_AND_ANSWERS = {
    b: [
      { 'ein Hemd für Frauen' => ['Bluse'] },
      { 'zuvorderst im Theater' => ['Bühne'] },
      { 'es gibt sie mit Heissluft und Gas' => ['Ballon'] },
      { 'Haare im Gesicht' => ['Bart'] },
      { 'ein paar Musiker' => ['Band'] },
      { 'es gibt sie in Bern, als Wasch-, Kragen- , Eis- …' => ['Bären'] },
      { 'hat ganz viele Muskeln' => ['Bodybuilder'] },
      { 'betrunken, als Farbe' => ['blau'] },
      { 'Hopfen, Malz und Wasser geben zusammen …' => ['Bier'] },
      { 'man kann drin lesen' => ['Buch'] },
      { 'kommt immer wieder zurück' => ['Boomerang'] },
      { 'liegt unter der Butter und der Konfitüre' => ['Brot'] },
      { 'zwei davon hat man im Gesicht' => ['Backen'] },
      { 'Eiger, Mönch und Jungfrau sind …' => ['Berge'] },
      { 'hängt an der Wand' => ['Bild'] },
      { 'ein spätes Frühstück' => ['Brunch'] },
      { 'ohne Schuhe und Socken' => ['barfuss'] },
      { 'Ort, wo man arbeitet' => ['Büro'] },
      { 'amerikanische Hose' => ['Blue Jeans'] },
      { 'nichts sehen' => ['blind'] },
      { 'krumm und gelb' => ['Banane'] },
      { 'Modeladen' => ['Boutique'] },
      { 'ein Schweizer Müesli' => ['Birchermüesli'] },
      { 'verleiht Bücher' => ['Bibliothek'] },
      { 'Ort, wo man schläft' => ['Bett'] },
      { 'Französisches Brot' => ['Baguette'] },
      { 'Honigtier' => ['Biene'] },
      { 'sitzt auf der Nase' => ['Brille'] },
      { 'Legierung aus Kupfer, dritter Platz' => ['Bronze'] }
    ],
  d: [
      { 'das sächliche Geschlecht' => ['das'] },
      { 'zwischen C und E' => ['D'] },
      { 'intelligentes Meeressäugetier' => ['Delfin'] },
      { 'männlicher Vorname' => ['Danilo , Daniel'] },
      { 'weiblicher Vorname' => ['Doris'] },
      { 'Stadt' => ['Davos'] },
      { 'Land' => ['Dänemark'] },
      { 'etwas zum Schreiben vorsagen' => ['diktieren'] },
      { 'das macht das Karussell' => ['drehen'] },
      { 'ein Wochentag' => ['Donnerstag'] },
      { 'bändigt im Zirkus wilde Tiere' => ['Dompteur'] },
      { 'thank grazie merci' => ['Danke'] },
      { 'das tun wir mit dem Kopf beim Rechnen' => ['denken'] },
      { '10 - 4 = 6 dann ist 6 die …' => ['Differenz'] },
      { 'dieser Mann saugt Blut' => ['Dracula'] },
      { 'den wäscht man ab' => ['Dreck'] },
      { 'nicht so klug' => ['dumm oder doof'] },
      { 'gegen Schweissgeruch' => ['Deo'] },
      { 'Hunderasse' => ['Dalmatiner'] },
      { 'ein Schnüffler }, findet Kriminelle' => ['Detektiv'] },
      { 'Ein Gerät zum Fechten' => ['Degen'] },
      { 'dort stecken Pelati drin' => ['Dose'] },
      { 'Hunger und' => ['Durst'] },
      { 'fines Nachtessen' => ['Dinner'] },
      { 'andere Hunderasse' => ['Dackel'] },
      { 'hat man im Bett' => ['Decke'] }
    ]
  }

  attr_reader :question, :answers

  def initialize(question: , answers:)
    @question = question
    @answers = answers
  end

  def self.find(character:, index:)
    QuestionAndAnswers.from_character(character)[index]
  end

  def self.from_character(character)
    questions_and_answers = QUESTIONS_AND_ANSWERS[character]
    questions_and_answers.map do |question_and_answers|
      QuestionAndAnswers.new(question: question_and_answers.keys[0], answers: question_and_answers.values[0])
    end
  end
end
