// Importing index.html to force webpack copy it to dist folder.
import './index.html';

const rootNode = document.getElementById('root');

rootNode.innerHTML = 'Here is something from webpack ;)';