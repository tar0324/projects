import React from "react";
import styled from "styled-components";

const Score = (props) => {

  const scoreMsg = props.scoreMsg;
  const name = props.name;
  return (
    <ScoreContainer>
      <Text>
        <span>{name}</span> 퀴즈에<br /> 
      대한 내 점수는?</Text>
      <MyScore>
        <span>100</span>점
        <p>{scoreMsg}</p>
      </MyScore>

      <Button>랭킹🏆</Button>
    </ScoreContainer>
    
  );
}

const ScoreContainer = styled.div`
  text-align: center;
  display: flex;
  width: 100vw;
  height: 100vh;
  overflow: hidden; // 넘치는것은 가려준다.
  padding: 16px;
  box-sizing: border-box;
  flex-direction: column; // div,p 등 각각을 세로로 정렬시킨다
  justify-content: center; //?
  align-items: center;
`;

const Text = styled.h1`
  font-size: 1.5em;
  margin: 0px;
  line-height: 1.4;
  & span{
    background-color: #FCE9DA;
    padding: 5px 10px;
    border-radius: 30px;
  }
`;

const MyScore = styled.div`
  
  
  & span{
    background-color: #FCE9DA;
    padding: 5px 10px;
    border-radius: 30px;
  }
  font-weight: 600;
  font-size: 2em;
  margin: 24px;
  & > p{
    margin: 24px 0px;
    font-size: 16px;
    font-weight: 400;
  }
`;

const Button = styled.button`
  padding: 8px 24px;
  background-color:#dadafc;
  border-radius: 30px;
  margin: 8px;
  border: 1px solid #dadafc;
  width: 50vw;
`;
export default Score;