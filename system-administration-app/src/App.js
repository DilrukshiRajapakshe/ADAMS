import React from 'react';
import './App.css';
import SideBar from './sidebar/sidebar';


function App() {
  return (
    <div id="App">
      <SideBar />
      <div id="Main-page">
        <h1 id="main-hedline" >Main Page</h1>
        <h2>Page content</h2>
      </div>
    </div>
  );
}

export default App;
