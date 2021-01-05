import React from "react";
import styled from "styled-components";
import img from "./dog.png";
import TinderCard from "react-tinder-card";


//
const Quiz = (props) => {

  const [num, setNum] = React.useState(0);



  const list = props.list;

  const onSwipe = (direction) => {
    
    console.log("You swiped: " + direction);
    setNum(num+1);
    
  };
  return (
    <QuizContainer>
        <p><span>{num+1}번 문제</span></p>

        {props.list.map((l, idx) => {
          if (num === idx) {
            return (<Question key={idx}>{l.question}</Question>);
          }
        })}
    
        
        
        <AnswerZone>
          <Answer>o</Answer>
          <Answer>x</Answer>
        </AnswerZone>

      {props.list.map((l, idx) => {
        if(idx === num) {
          return (
            <DragItem key={idx}>

              <TinderCard onSwipe={onSwipe}>
                <img src={img}></img>
              </TinderCard>
            </DragItem>
          );
        }
      })}
       
        
    </QuizContainer>
  );
}

const QuizContainer = styled.div`
  text-align: center;
  & > p > span { //?
    padding: 8px 16px;
    background-color: #E098AE;
    border-radius: 30px;
  }
`;

const Question = styled.h1`
  font-size: 1.5em; // 단위?
  padding: 80px;
`;

const AnswerZone = styled.div`
  width: 100%;
  height: 100vh;
  display: flex; //가운데 정렬
  position: absolute;  //백그라운드에있어야한다. 전체영역을 잡고있어도 된다.
  top: 0; // y좌표
  left: 0; //x좌표
  z-index: 1; //3차원으로 생각해야함 
`;

const Answer = styled.div`
  width: 50%;
  display: flex;
  justify-content: center;  //?
  align-items: center; //?
  font-size: 10em;
  font-weight: 700;
  color: #F7EAE2;
`;

const DragItem = styled.div`
  position: fixed; //?
  top: 0;
  left: 0 ;
  z-index: 10; //AnswerZone 보다 앞에 있어야하니까 더 큰 숫자를 넣음
  width: 100vw;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  & img{ //?
    max-width: 150px;
  }
  & > div{
    background-color:#FFD0A6;
    border-radius: 75px;
  }

`;

  
export default Quiz;