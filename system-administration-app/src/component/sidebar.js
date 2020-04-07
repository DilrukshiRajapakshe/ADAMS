import React from 'react';
import { slide as Menu } from 'react-burger-menu';
import Admin from './admin';
import Home from './home';
import Dashboard from './dashboard';
import Diseases from './diseases';
import { Route, Link, BrowserRouter as Router, Switch } from 'react-router-dom'
import Setting from './setting';
export default props => {
  return (
    <Router>
      <Menu>
        <Link className="menu-item" to="/">Home</Link>
        <Link className="menu-item" to="/admin">Admin</Link>
        <Link className="menu-item" to="/dashboard">Dashboard</Link>
        <Link tclassName="menu-item" to="/diseases">Diseases</Link>
        <Link tclassName="menu-item" to="/setting">Setting</Link>
      </Menu>
      <Switch>
        <Route exact path="/" component={Home} />
        <Route  path="/admin" component={Admin} />
        <Route path="/dashboard" component={Dashboard} />
        <Route path="/diseases" component={Diseases} />
        <Route path="/setting" component={Setting} />
      </Switch>
    </Router>
  );
};