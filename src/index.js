// Importing index.html to force webpack copy it to dist folder.
import './index.html';

import { Elm } from './Main.elm';

Elm.Main.embed(document.getElementById('root'));