import React from 'react';
import { slide as Menu } from 'react-burger-menu';

export default props => {
  return (
    <Menu>
      <a className="menu-item" href="/">
        1st link
      </a>

      <a className="menu-item" href="/">
        2nd link
      </a>

      <a className="menu-item" href="/">
        3rd links
      </a>

      <a className="menu-item" href="/">
        4th link
      </a>

      <a className="menu-item" href="/">
        5th link
      </a>
    </Menu>
  );
};