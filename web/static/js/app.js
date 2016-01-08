import React, { Component } from 'react';
import { render } from 'react-dom';

require("./../css/app.scss");

export class App extends Component {
  render() {
    return (
      <div>
          <h1>oie</h1>
        </div>
    );
  }
}

render(<App />, document.getElementById('root'));
