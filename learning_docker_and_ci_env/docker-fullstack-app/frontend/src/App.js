import React, { useEffect, useState } from 'react';
import axios from 'axios';
import logo from './logo.svg';
import './App.css';

function App() {
  const [list, setList] = useState([]);
  const [value, setValue] = React.useState();

  const handleClickSubmit = (e) => {
    e.preventDefault();

    axios.post('/api/value', { value }).then(res => {
      if (res.data.success) {
        setList([...list, res.data]);
        setValue('');
      } else {
        alert('값을 db에 넣는데 실패했습니다.');
      }
    });
  };

  useEffect(() => {
    axios.get('/api/values').then(res => {
      console.log('response: ', res);
      setList(res.data);
    }).catch(err => {
      console.log(err);
    })
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        {
          list && list.map((item, index) => <li key={index}>{item.value}</li>)
        }
        <form onSubmit={handleClickSubmit}>
          <input type='text' value={value} onChange={(e) => setValue(e.target.value)}/>
          <button type="submit">확인@</button>
        </form>
      </header>
    </div>
  );
}

export default App;
