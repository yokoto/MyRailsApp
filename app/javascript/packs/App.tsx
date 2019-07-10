import React, { Component } from "react";
import UserList from "./UserList";

import Axios from "axios";

interface ApiConfig {
  baseURL: string;
  timeout: number;
}

const DEFAULT_API_CONFIG: ApiConfig = {
  baseURL: 'https://localhost:3000',
  timeout: 7000,
};

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      users: UserList
    };
    this.getUsersFactory = this.getUsersFactory.bind(this);
  }

  componentDidMounti() {
    this.getUsersFactory()
  }

  getUsersFactory = (optionConfig?: ApiConfig) => {
    const config = {
      ...DEFAULT_API_CONFIG,
      ...optionConfig,
    };
    const instance = Axios.create(config);
    const getUsers = async () => {
      try {
        const response  = await instance.get(`/api/top`);
        if (response.status != 200) {
          throw new Error('Server Error');
        }
        console.log(response.data);
        this.setState({
          users: response.data
        });
      } catch (err) {
        throw err;
      }
    };
    return getUsers;
  }

  render() {
    return (
      <div className="container">
        <header>
          <h3>ユーザー一覧</h3>
        </header>
        <UserList />
      </div>
    )
  }
}

export default App;