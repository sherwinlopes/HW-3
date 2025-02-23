import React, { useState } from "react";
import "./App.css";

const App = () => {
  const colors = ["#E30B5C", "#4169E1", "#50C878", "#FFDB58"];
  const [bgColor, setBgColor] = useState(colors[0]);

  const changeColor = () => {
    const nextColor = colors[(colors.indexOf(bgColor) + 1) % colors.length];
    setBgColor(nextColor);
  };

  return (
    <div className="container" style={{ backgroundColor: bgColor }}>
      <button className="color-button" onClick={changeColor}>
        Change Background Color
      </button>
    </div>
  );
};

export default App;