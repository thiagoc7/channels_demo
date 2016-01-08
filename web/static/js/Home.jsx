import React, { Component, PropTypes } from 'react';

import Form from './Form.jsx';
import Filter from './Filter.jsx';
import Tasks from './Tasks.jsx';

export default class Home extends Component {
  constructor(props) {
    super(props);

    this.state = {
      initialDate: '2016-01-01',
      finalDate: '2016-01-31',
      tasks: [
        {
          date: '2016-01-01',
          description: "bla bla bla 1"
        },
        {
          date: '2016-01-02',
          description: "bla bla bla 2"
        }
      ]
    }
  }

  onCreate(task) {
    this.setState({
      tasks: [...this.state.tasks, task]
    });
  }

  onFilter(dates) {
    this.setState(dates);
    console.log(dates)
  }

  render() {
    return (
        <div className="container">

          <Form onCreate={this.onCreate.bind(this)}/>

          <Filter
              initialDate={this.state.initialDate}
              finalDate={this.state.finalDate}
              onFilter={this.onFilter.bind(this)}
          />

          <Tasks tasks={this.state.tasks}/>

        </div>
    )
  }
}