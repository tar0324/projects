import logo from './logo.svg';
import './App.css';
import React from "react";

import Start from "./Start";
import Quiz from "./Quiz";
import Score from "./Score";

class App extends React.Component{
  constructor(props){
    super(props);
// state에 필요한 데이터를 넣어줘요!
    this.state = {
      name: "강아지",
      page: "quiz",
      list: [// quiz질문들의 리스트
        {question:"강아지를 혼낼 때 하품하는 이유는 졸립고 지루해서 이다.", answer:"X"},
        {question:"강아지가 다른 강아지의 엉덩이 냄새를 맡는 것은 인사하는 것과 같다.", answer:"O"},
        {question:"강아지가 주인 양말을 숨기는 행동은 놀아달라는 표현이다.", answer:"X"},
        {question:"강아지에게 포도는 위험하지만 건포도는 먹여도 된다.", answer:"X"},

      ],
      scoreMsg: "대단해요❗ 아주 잘 아시는군요❗"
     
    };
  }

  render () {
    return (
      <div className="App">
        {this.state.page === "quiz" && <Quiz list={this.state.list}/>}
        {this.state.page === "start" && <Start name={this.state.name}/>}
        {this.state.page === "score" && <Score name={this.state.name} scoreMsg={this.state.scoreMsg}/>}
        {/* <Start name={this.state.name}/> */}
        
      </div>
    );
  }
}

export default App;
