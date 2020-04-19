import React from 'react';
import './App.css';
import SideBar from './component/sidebar';
import Logo from './image/logo.png';

function App() {
  return (
    <div id="App">
      <div className="container" >
        <div id="imageDiv"><img id='logo' src={Logo}></img></div>
        <div id="h5Div"><h6 id="tital">ADAMS Administration Dashboard</h6></div>
      </div>
      <SideBar/>
    </div>
  );
}

export default App;