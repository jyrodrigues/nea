// Importing index.html to force webpack copy it to dist folder.
import './index.html';
import './_redirects';

import { Elm } from './Index.elm';

// const main = Elm.Main.init({
//   node: document.getElementById('main')
// });

// Initializing and Elm application apparently overrides everything inside <body>!
Elm.Nav.init();

