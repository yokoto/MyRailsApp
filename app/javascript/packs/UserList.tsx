import React, { Component } from "react";

interface User {
  id: number;
  name: string;
  email: string;
}

interface UserListState {
  users: User[];
}

class UserList extends Component<{}, UserListState> {
  constructor(props: {}) {
    super(props);
    this.state = { users: [] };
  }

  render() {
    const { users } = this.state;
    return (
      <>
        <div>
          <p>ここからがユーザー一覧のループです</p>
          {users.map(u => (
            <ul>
              <li>{u.id}</li>
              <li>{u.name}</li>
              <li>{u.email}</li>
            </ul>
          ))}
        </div>
      </>
    );
  }
}

export default UserList;