// Importing index.html to force webpack copy it to dist folder.
import './index.html';

import { Elm } from './Main.elm';

// const app = Elm.Main.init({
const app = Elm.Nav.init({
  node: document.getElementById('root')
});