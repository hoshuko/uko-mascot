// Copie uko-mascot-engine.min.js dans ton projet (ex. src/vendor/) puis :
import './vendor/uko-mascot-engine.min.js';

export function UkoStatus({ status = 'idle', hair = 'classique', color = '#FFD6E0' }) {
  // status: idle | welcome | thinking | loading | success | error | empty | sleep | wake (les 9 états, version gratuite comprise)
  return <uko-mascot state={status} hair={hair} brand={color} style={{ width: 200, height: 300 }} />;
}

// Exemple : un formulaire
// <UkoStatus status={saving ? 'loading' : saved ? 'success' : 'idle'} />
