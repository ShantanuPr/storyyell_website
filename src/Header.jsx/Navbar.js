// src/Navbar.js
import React, { useState } from 'react';
import './Navbar.css';

const Navbar = () => {
  const [isOpen, setIsOpen] = useState(false);

  const toggleNavbar = () => {
    setIsOpen(!isOpen);
  };

  return (
    <nav className="navbar">
      <div className="nav-logo">StoryYell</div>
      <div className={`nav-links ${isOpen ? 'open' : ''}`}>
        <a href="#home">Home</a>
        <a href="#about">Audit</a>
        <a href="#services">Pricing</a>
        <a href="#contact">Blogs</a>
      </div>
      <button className="nav-button">Contact Us</button>
      <div className="nav-toggle" onClick={toggleNavbar}>
        <div className="bar"></div>
        <div className="bar"></div>
        <div className="bar"></div>
        
        
      </div>
    </nav>
  );
};

export default Navbar;
